import type { CollectionBeforeChangeHook } from 'payload'

export const pushToFrappeERPHook: CollectionBeforeChangeHook = async ({ data, req, operation }) => {
  // Only execute when a new form submission is created
  if (operation !== 'create') return data

  try {
    // 1. Fetch form configuration to check if ERP push is enabled
    const formId = typeof data.form === 'object' && data.form !== null ? (data.form as any).id : data.form
    if (!formId) {
      console.log('[Frappe ERP] Submission does not reference a valid form. Skipping.')
      data.erpStatus = 'not_configured'
      data.erpResponse = 'Submission lacks parent form ID.'
      return data
    }

    let form: any = null
    try {
      form = typeof data.form === 'object' && data.form !== null ? data.form : await req.payload.findByID({
        collection: 'forms',
        id: String(formId),
        depth: 0,
      })
    } catch (err: any) {
      console.warn('[Frappe ERP] Form fetch warning:', err?.message)
    }

    // If form explicitly disables ERP push, mark as not configured and exit
    if (!form?.enableErpPush) {
      console.log(`[Frappe ERP] Push disabled for form "${form?.title || formId}". Skipping.`)
      data.erpStatus = 'not_configured'
      data.erpResponse = 'ERP Push is disabled on this form configuration.'
      return data
    }

    // 2. Resolve target Frappe endpoint URL & Method (using Form configuration first, then global Settings)
    const settings = await req.payload.findGlobal({ slug: 'settings' })
    const frappeUrl = form.frappeUrl || settings?.frappeUrl || process.env.FRAPPE_URL || ''
    const apiMethod = form.apiMethod || settings?.frappeApiMethod || process.env.FRAPPE_API_METHOD || 'receive_website_lead'
    
    // Auth settings (always global for security)
    const apiKey = settings?.frappeApiKey || process.env.FRAPPE_API_KEY || ''
    const apiSecret = settings?.frappeApiSecret || process.env.FRAPPE_API_SECRET || ''

    if (!frappeUrl) {
      console.log('[Frappe ERP] Endpoint URL is not configured. Skipping.')
      data.erpStatus = 'failed'
      data.erpResponse = 'Frappe URL not configured (Form override or global Settings required).'
      return data
    }

    // 3. Normalize submitted fields into a key-value lookup map
    const submissionData = data.submissionData || []
    const submittedFields: Record<string, string> = {}
    submissionData.forEach((item: any) => {
      if (item.field && item.value) {
        submittedFields[item.field] = item.value
      }
    })

    // Resolve client IP address
    let clientIp = ''
    try {
      const xForwardedFor = req?.headers?.get('x-forwarded-for')
      if (xForwardedFor) {
        clientIp = xForwardedFor.split(',')[0].trim()
      } else {
        clientIp = (req as any)?.ip || ''
      }
    } catch (_) {}

    // 4. Construct payload using form field mapping or standard fallback keys
    const payload: Record<string, any> = {}
    const fieldMapping = form.fieldMapping || []

    if (fieldMapping.length > 0) {
      // Use explicit per-form mapping configured by the user
      fieldMapping.forEach((map: any) => {
        if (map.formField && map.frappeField) {
          payload[map.frappeField] = submittedFields[map.formField] || ''
        }
      })
    } else {
      // Standard backward-compatible fallback mapping
      payload.user_name = submittedFields['your-name'] || submittedFields['name'] || submittedFields['userName'] || submittedFields['first-name'] || ''
      payload.email = submittedFields['your-email'] || submittedFields['email'] || ''
      payload.phone = submittedFields['your-phone'] || submittedFields['phone'] || submittedFields['mobile'] || ''
      payload.message = submittedFields['message'] || submittedFields['your-message'] || submittedFields['comments'] || ''
      payload.preferred_tour_date = submittedFields['tour-date'] || submittedFields['date'] || null
      payload.type_of_business = submittedFields['type-of-business'] || submittedFields['business-type'] || null
    }

    // Always inject metadata keys if not overridden
    if (payload.form_id === undefined) payload.form_id = String(formId)
    if (payload.ip_address === undefined) payload.ip_address = clientIp

    // 5. Append additional form static fields
    const staticFields = form.staticFields || []
    staticFields.forEach((staticField: any) => {
      if (staticField.frappeField) {
        payload[staticField.frappeField] = staticField.value ?? ''
      }
    })

    // 6. Build HTTP Request headers
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
      Accept: 'application/json',
    }

    if (apiKey && apiSecret) {
      headers['Authorization'] = `token ${apiKey}:${apiSecret}`
    }

    // 7. Make API request to Frappe ERP
    const methodUrl = frappeUrl.endsWith('/') ? frappeUrl : `${frappeUrl}/`
    const endpoint = `${methodUrl}api/method/${apiMethod}`

    console.log(`[Frappe ERP] Pushing dynamic submission to ${endpoint}...`, {
      formName: form.title,
      payloadKeys: Object.keys(payload),
    })

    const response = await fetch(endpoint, {
      method: 'POST',
      headers,
      body: JSON.stringify(payload),
    })

    const responseBody = await response.text()
    let jsonResponse: any = null
    try {
      jsonResponse = JSON.parse(responseBody)
    } catch (_) {}

    // 8. Log the ERP sync result in Payload submission record
    if (response.status >= 500) {
      data.erpStatus = 'failed'
      data.erpResponse = `Server Error (HTTP ${response.status}): ${responseBody.slice(0, 400)}`
      return data
    }

    if (response.status === 401 || response.status === 403) {
      data.erpStatus = 'failed'
      data.erpResponse = `Authentication Failed (HTTP ${response.status}). Verify API Key/Secret.`
      return data
    }

    if (response.status === 404) {
      data.erpStatus = 'failed'
      data.erpResponse = `Endpoint Method not found (HTTP 404). Verify URL and method.`
      return data
    }

    if (response.status === 200) {
      const erpMsg = jsonResponse?.message
      if (erpMsg?.status === 'success') {
        data.erpStatus = 'success'
        data.erpLeadId = erpMsg.lead || erpMsg.lead_id || erpMsg.name || ''
        data.erpResponse = 'Lead successfully synced to Frappe ERP.'
      } else if (erpMsg?.status === 'error') {
        data.erpStatus = 'failed'
        data.erpResponse = `ERP Error message: ${erpMsg.reason || erpMsg.message || 'Unknown reason'}`
      } else {
        data.erpStatus = 'success'
        data.erpResponse = `Pushed successfully. Raw: ${responseBody.slice(0, 300)}`
      }
    } else {
      data.erpStatus = 'failed'
      data.erpResponse = `ERP returned HTTP ${response.status}. Raw: ${responseBody.slice(0, 300)}`
    }
  } catch (err: any) {
    console.error('[Frappe ERP] Push hook crashed:', err)
    data.erpStatus = 'failed'
    data.erpResponse = `Hook crash: ${err.message}`
  }

  return data
}

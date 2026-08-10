import type { CollectionAfterChangeHook } from 'payload'

export const syncToCF7TrackerHook: CollectionAfterChangeHook = async ({ doc, req, operation }) => {
  // Only execute on document creation
  if (operation !== 'create') return doc

  try {
    const formId = typeof doc.form === 'object' && doc.form !== null ? (doc.form as any).id : doc.form
    if (!formId) return doc

    // 1. Fetch original form to retrieve the title/name
    const form = typeof doc.form === 'object' && doc.form !== null ? doc.form : await req.payload.findByID({
      collection: 'forms',
      id: String(formId),
    })

    // 2. Map form submission data fields into a key-value record
    const submissionData = doc.submissionData || []
    const fieldsMap: Record<string, string> = {}
    submissionData.forEach((item: any) => {
      if (item.field && item.value) {
        fieldsMap[item.field] = item.value
      }
    })

    // Resolve submitter details
    const name = fieldsMap['your-name'] || fieldsMap['name'] || fieldsMap['userName'] || fieldsMap['first-name'] || ''
    const email = fieldsMap['your-email'] || fieldsMap['email'] || ''
    const phone = fieldsMap['your-phone'] || fieldsMap['phone'] || fieldsMap['mobile'] || ''

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
    fieldsMap.ip_address = clientIp

    // 3. Create duplicate record in our CF7 Tracker collection
    console.log(`[CF7 Tracker] Duplicating submission for form "${form?.title || formId}" into CF7 Tracker collection...`)
    await req.payload.create({
      collection: 'cf7-tracker',
      data: {
        formId: Number(formId),
        formName: form?.title || `Form #${formId}`,
        submitterName: name,
        submitterEmail: email,
        submitterPhone: phone,
        formData: fieldsMap,
        mailStatus: doc.erpStatus === 'success' ? 'sent' : 'pending',
        erpStatus: doc.erpStatus || 'pending',
        erpLeadId: doc.erpLeadId || '',
        erpResponse: doc.erpResponse || '',
        retryCount: 0,
      },
      overrideAccess: true,
    })
  } catch (err) {
    console.error('[CF7 Tracker] Failed to sync to tracker collection:', err)
  }

  return doc
}

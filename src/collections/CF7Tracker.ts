import type { CollectionConfig } from 'payload'
import { isAdminOrEditor, canAccessAdminPanel } from '../access/roles'

export const CF7Tracker: CollectionConfig = {
  slug: 'cf7-tracker',
  labels: {
    singular: 'CF7 Submission',
    plural: 'CF7 Tracker',
  },
  admin: {
    useAsTitle: 'submitterName',
    defaultColumns: ['formName', 'submitterName', 'submitterEmail', 'erpStatus', 'erpLeadId', 'createdAt'],
  },
  access: {
    create: () => true, // submissions can be created from frontend/hooks
    read: canAccessAdminPanel,
    update: canAccessAdminPanel,
    delete: isAdminOrEditor,
  },
  fields: [
    // Retries section in sidebar
    {
      name: 'retryButton',
      type: 'ui',
      admin: {
        position: 'sidebar',
        components: {
          Field: '@/components/CF7Tracker/RetryButton',
        },
      },
    },
    {
      name: 'formId',
      type: 'number',
      label: 'Form ID',
      required: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'formName',
      type: 'text',
      label: 'Form Name',
      required: true,
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'submitterName',
      type: 'text',
      label: 'Submitter Name',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'submitterEmail',
      type: 'text',
      label: 'Submitter Email',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'submitterPhone',
      type: 'text',
      label: 'Submitter Phone',
      admin: {
        readOnly: true,
      },
    },
    {
      name: 'formData',
      type: 'json',
      label: 'Submitted Fields JSON',
      admin: {
        readOnly: true,
      },
    },
    // Status tracking fields (Positioned in sidebar)
    {
      name: 'mailStatus',
      type: 'select',
      label: 'Mail Delivery Status',
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Sent', value: 'sent' },
        { label: 'Failed', value: 'failed' },
      ],
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'mailNote',
      type: 'textarea',
      label: 'Mail Log Note',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'erpStatus',
      type: 'select',
      label: 'ERP Status',
      defaultValue: 'pending',
      options: [
        { label: 'Pending', value: 'pending' },
        { label: 'Success', value: 'success' },
        { label: 'Failed', value: 'failed' },
        { label: 'Not Configured', value: 'not_configured' },
      ],
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'erpLeadId',
      type: 'text',
      label: 'ERP Lead ID',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'erpResponse',
      type: 'textarea',
      label: 'ERP API Response',
      admin: {
        position: 'sidebar',
      },
    },
    {
      name: 'retryCount',
      type: 'number',
      label: 'Retry Count',
      defaultValue: 0,
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
    {
      name: 'lastRetryAt',
      type: 'date',
      label: 'Last Retry Timestamp',
      admin: {
        position: 'sidebar',
        readOnly: true,
      },
    },
  ],
  endpoints: [
    {
      path: '/:id/retry',
      method: 'post',
      handler: async (req) => {
        const id = req.routeParams?.id as string | undefined
        if (!id) {
          return Response.json({ success: false, message: 'Missing submission ID.' }, { status: 400 })
        }

        try {
          // Fetch CF7Tracker submission
          const submission = await req.payload.findByID({
            collection: 'cf7-tracker',
            id,
          })

          if (!submission) {
            return Response.json({ success: false, message: 'Submission not found.' }, { status: 404 })
          }

          // Fetch original Form settings
          const form = await req.payload.findByID({
            collection: 'forms',
            id: String(submission.formId),
          })

          const settings = await req.payload.findGlobal({ slug: 'settings' })
          const frappeUrl = form?.frappeUrl || settings?.frappeUrl || process.env.FRAPPE_URL || ''
          const apiMethod = form?.apiMethod || settings?.frappeApiMethod || process.env.FRAPPE_API_METHOD || 'receive_website_lead'
          const apiKey = settings?.frappeApiKey || process.env.FRAPPE_API_KEY || ''
          const apiSecret = settings?.frappeApiSecret || process.env.FRAPPE_API_SECRET || ''

          if (!frappeUrl) {
            return Response.json({ success: false, message: 'Frappe URL not configured.' }, { status: 400 })
          }

          // Build raw payload from submission
          const submittedFields = (submission.formData as Record<string, string>) || {}
          const payload: Record<string, any> = {}
          const fieldMapping = form?.fieldMapping || []

          if (fieldMapping.length > 0) {
            fieldMapping.forEach((map: any) => {
              if (map.formField && map.frappeField) {
                payload[map.frappeField] = submittedFields[map.formField] || ''
              }
            })
          } else {
            payload.user_name = submission.submitterName || ''
            payload.email = submission.submitterEmail || ''
            payload.phone = submission.submitterPhone || ''
            payload.message = submittedFields['message'] || submittedFields['your-message'] || ''
          }

          payload.form_id = String(submission.formId)
          payload.ip_address = submittedFields.ip_address || ''

          const staticFields = form?.staticFields || []
          staticFields.forEach((staticField: any) => {
            if (staticField.frappeField) {
              payload[staticField.frappeField] = staticField.value ?? ''
            }
          })

          // Request setup
          const headers: Record<string, string> = {
            'Content-Type': 'application/json',
            Accept: 'application/json',
          }

          if (apiKey && apiSecret) {
            headers['Authorization'] = `token ${apiKey}:${apiSecret}`
          }

          const methodUrl = frappeUrl.endsWith('/') ? frappeUrl : `${frappeUrl}/`
          const endpoint = `${methodUrl}api/method/${apiMethod}`

          const res = await fetch(endpoint, {
            method: 'POST',
            headers,
            body: JSON.stringify(payload),
          })

          const body = await res.text()
          let json: any = null
          try {
            json = JSON.parse(body)
          } catch (_) {}

          let updateData: Record<string, any> = {
            retryCount: (submission.retryCount || 0) + 1,
            lastRetryAt: new Date().toISOString(),
          }

          if (res.status === 200) {
            const erpMsg = json?.message
            if (erpMsg?.status === 'success') {
              updateData.erpStatus = 'success'
              updateData.erpLeadId = erpMsg.lead || erpMsg.lead_id || erpMsg.name || ''
              updateData.erpResponse = 'Lead successfully synced to Frappe ERP.'
            } else if (erpMsg?.status === 'error') {
              updateData.erpStatus = 'failed'
              updateData.erpResponse = `ERP Error: ${erpMsg.reason || erpMsg.message || 'Unknown error'}`
            } else {
              updateData.erpStatus = 'success'
              updateData.erpResponse = `Pushed successfully. Raw: ${body.slice(0, 300)}`
            }
          } else {
            updateData.erpStatus = 'failed'
            updateData.erpResponse = `HTTP ${res.status}: ${body.slice(0, 300)}`
          }

          // Update record
          await req.payload.update({
            collection: 'cf7-tracker',
            id,
            data: updateData,
          })

          return Response.json({
            success: updateData.erpStatus === 'success',
            message: updateData.erpResponse,
            lead_id: updateData.erpLeadId || '',
          })
        } catch (err: any) {
          return Response.json({ success: false, message: `Server error: ${err.message}` }, { status: 500 })
        }
      },
    },
  ],
  timestamps: true,
}

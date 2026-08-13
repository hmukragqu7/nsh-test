/**
 * sendFormEmailsHook — afterChange hook for form-submissions
 * Sends emails configured in Admin -> Forms -> [Form] -> Emails tab via req.payload.sendEmail().
 * Supports variable replacement: {{name}}, {{email}}, {{phone}}, {{message}}, {{pageUrl}}, etc.
 */

import type { CollectionAfterChangeHook } from 'payload'

function unescapeHtml(str: string): string {
  if (!str) return ''
  return str
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&amp;/g, '&')
}

export const sendFormEmailsHook: CollectionAfterChangeHook = async ({ doc, req, operation }) => {
  if (operation !== 'create') return doc

  try {
    const formId = typeof doc.form === 'object' ? doc.form?.id : doc.form
    if (!formId) return doc

    // Fetch parent form configuration
    const form = (await req.payload.findByID({
      collection: 'forms',
      id: String(formId),
      depth: 0,
    })) as any

    const emailsConfig = form?.emails as Array<{
      emailTo?: string
      subject?: string
      message?: any
      emailFrom?: string
      replyTo?: string
      cc?: string
      bcc?: string
    }>

    if (!emailsConfig || !emailsConfig.length) return doc

    // Extract form submission fields into key-value map
    const submissionData = (doc.submissionData as Array<{ field: string; value: string }>) || []
    const variables: Record<string, string> = {
      formName: form?.title || form?.name || 'Website Form',
      currentYear: new Date().getFullYear().toString(),
    }

    const fieldList: Array<{ label: string; value: string }> = []

    submissionData.forEach(({ field, value }) => {
      const valStr = String(value ?? '')
      variables[field] = valStr

      const label = field
        .replace(/[-_]/g, ' ')
        .replace(/([a-z])([A-Z])/g, '$1 $2')
        .replace(/\b\w/g, (l) => l.toUpperCase())

      fieldList.push({ label, value: valStr })
    })

    // Variable replacement helper
    const replaceVariables = (str: string): string => {
      if (!str) return ''
      return str.replace(/\{\{\s*([a-zA-Z0-9_-]+)\s*\}\}/g, (_, key) => {
        return variables[key] !== undefined ? variables[key] : `{{${key}}}`
      })
    }

    // Convert Lexical / String message to clean plain text / HTML
    const getHtmlBody = (msg: any): string => {
      if (!msg) return ''
      let rawText = ''

      if (typeof msg === 'string') {
        rawText = msg
      } else if (typeof msg === 'object') {
        try {
          if (msg.root?.children) {
            const extractNodes = (nodes: any[]): string => {
              return nodes
                .map((node: any) => {
                  if (node.text) return node.text
                  if (node.children) return extractNodes(node.children)
                  return ''
                })
                .join('\n')
            }
            rawText = extractNodes(msg.root.children)
          } else {
            rawText = JSON.stringify(msg)
          }
        } catch {
          rawText = String(msg)
        }
      }

      const interpolated = replaceVariables(rawText)
      return unescapeHtml(interpolated)
    }

    // Build styled HTML table for Admin email
    const buildFieldTableHtml = (): string => {
      return `<table style="width:100%; border-collapse:collapse; font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; font-size:14px; margin-top:16px; border:1px solid #e2e8f0;">
        <tbody>
          ${fieldList
            .map(
              (f) => `<tr>
              <td style="padding:10px 14px; background:#f8fafc; font-weight:600; color:#334155; width:28%; border-bottom:1px solid #e2e8f0; border-right:1px solid #e2e8f0;">${f.label}</td>
              <td style="padding:10px 14px; color:#0f172a; border-bottom:1px solid #e2e8f0;">${f.value || '<em style="color:#94a3b8;">N/A</em>'}</td>
            </tr>`,
            )
            .join('')}
        </tbody>
      </table>`
    }

    // Process each configured email in form.emails
    for (const emailItem of emailsConfig) {
      const rawTo = emailItem.emailTo
      if (!rawTo) continue

      const interpolatedTo = replaceVariables(rawTo).trim()
      if (!interpolatedTo) continue

      // Split multiple recipients by comma or semicolon
      const recipients = interpolatedTo
        .split(/[,;]/)
        .map((e) => e.trim())
        .filter((e) => e.includes('@'))

      if (!recipients.length) {
        req.payload.logger.warn(`[sendFormEmailsHook] No valid email recipient in "${interpolatedTo}" — skipping`)
        continue
      }

      const subject = replaceVariables(emailItem.subject || `New Submission: ${variables.formName}`)

      // Check if recipient is customer (contains {{email}})
      const isCustomerEmail = rawTo.includes('{{email}}')

      let bodyHtml = ''
      if (isCustomerEmail) {
        // Customer Email: ONLY the thank-you message (no field table!)
        const rawMsg = getHtmlBody(emailItem.message)
        const paragraphs = rawMsg
          .split('\n')
          .filter((p) => p.trim())
          .map((p) => `<p style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; font-size:15px; color:#1e293b; margin:0 0 12px 0;">${p}</p>`)
          .join('')

        bodyHtml = paragraphs || `<p style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; font-size:15px; color:#1e293b;">Thank You ${variables.name || ''}, We received your inquiry. Our concierge team will contact you shortly.</p>`
      } else {
        // Admin Email: ONLY the styled table containing submitted details (no duplicate text!)
        bodyHtml = `<h2 style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif; font-size:18px; color:#0f172a; margin-top:0; margin-bottom:12px;">New Form Inquiry: ${variables.formName}</h2>` + buildFieldTableHtml()
      }

      const finalHtml = `<!DOCTYPE html>
<html>
<head><meta charset="utf-8"><style>body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;color:#1e293b;line-height:1.6;padding:20px;}</style></head>
<body>
  ${bodyHtml}
</body>
</html>`

      for (const toEmail of recipients) {
        req.payload.logger.info(`[sendFormEmailsHook] Dispatching email to ${toEmail} (Subject: "${subject}")`)

        req.payload
          .sendEmail({
            to: toEmail,
            from:
            emailItem.emailFrom ||
            `"${process.env.SMTP_FROM_NAME || 'Novel Signature Homes'}" <${process.env.SMTP_FROM || 'info@novelsignaturehomes.com'}>`,
            replyTo: emailItem.replyTo ? replaceVariables(emailItem.replyTo) : undefined,
            cc: emailItem.cc ? replaceVariables(emailItem.cc) : undefined,
            bcc: emailItem.bcc ? replaceVariables(emailItem.bcc) : undefined,
            subject,
            html: finalHtml,
          })
          .then(() => {
            req.payload.logger.info(`[sendFormEmailsHook] ✓ Email delivered to ${toEmail}`)
          })
          .catch((err: any) => {
            req.payload.logger.error(`[sendFormEmailsHook] ❌ Failed delivering to ${toEmail}: ${err?.message}`)
          })
      }
    }
  } catch (err: any) {
    req.payload.logger.error(`[sendFormEmailsHook] Error: ${err?.message}`)
  }

  return doc
}

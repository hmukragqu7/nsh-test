import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

function createLexicalMessage(text: string) {
  return {
    root: {
      type: 'root',
      format: '',
      indent: 0,
      version: 1,
      children: [
        {
          type: 'paragraph',
          format: '',
          indent: 0,
          version: 1,
          children: [
            {
              type: 'text',
              detail: 0,
              format: 0,
              mode: 'normal',
              style: '',
              text,
              version: 1,
            },
          ],
        },
      ],
    },
  }
}

async function seedCmsForms() {
  const payload = await getPayload({ config: configPromise })

  const formsData = [
    {
      title: 'Buy A Home Inquiry Form',
      submitButtonLabel: 'Submit Inquiry',
      confirmationType: 'message',
      confirmationMessage: createLexicalMessage(
        'Thank you for your inquiry! Our sales team will get in touch with you shortly.'
      ),
      fields: [
        {
          blockType: 'text',
          name: 'name',
          label: 'Full Name',
          required: true,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'phone',
          label: 'Phone Number',
          required: false,
          width: 100,
        },
        {
          blockType: 'email',
          name: 'email',
          label: 'Email Address',
          required: true,
          width: 100,
        },
        {
          blockType: 'textarea',
          name: 'message',
          label: 'Message',
          required: false,
          width: 100,
        },
      ],
    },
    {
      title: 'Trade Inquiry Form',
      submitButtonLabel: 'Submit Trade Inquiry',
      confirmationType: 'message',
      confirmationMessage: createLexicalMessage(
        'Thank you for your trade inquiry! Our team will reach out to explore partnership opportunities.'
      ),
      fields: [
        {
          blockType: 'text',
          name: 'name',
          label: 'Full Name / Company Representative',
          required: true,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'phone',
          label: 'Phone Number',
          required: false,
          width: 100,
        },
        {
          blockType: 'email',
          name: 'email',
          label: 'Email Address',
          required: true,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'type_of_business',
          label: 'Type of Business',
          required: true,
          width: 100,
        },
        {
          blockType: 'textarea',
          name: 'message',
          label: 'Message (optional)',
          required: false,
          width: 100,
        },
      ],
    },
    {
      title: 'Other Inquiries Form',
      submitButtonLabel: 'Submit Inquiry',
      confirmationType: 'message',
      confirmationMessage: createLexicalMessage(
        'Thank you for reaching out! We have received your message and will get back to you shortly.'
      ),
      fields: [
        {
          blockType: 'text',
          name: 'name',
          label: 'Full Name',
          required: true,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'phone',
          label: 'Phone Number',
          required: false,
          width: 100,
        },
        {
          blockType: 'email',
          name: 'email',
          label: 'Email Address',
          required: true,
          width: 100,
        },
        {
          blockType: 'textarea',
          name: 'message',
          label: 'Message',
          required: false,
          width: 100,
        },
      ],
    },
    {
      title: 'Concierge Service Request Form',
      submitButtonLabel: 'Request Concierge Service',
      confirmationType: 'message',
      confirmationMessage: createLexicalMessage(
        'Thank you for your request! Our concierge team will assist you shortly.'
      ),
      fields: [
        {
          blockType: 'text',
          name: 'name',
          label: 'Full Name',
          required: true,
          width: 100,
        },
        {
          blockType: 'email',
          name: 'email',
          label: 'Email Address',
          required: true,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'phone',
          label: 'Phone Number',
          required: false,
          width: 100,
        },
        {
          blockType: 'text',
          name: 'service_requested',
          label: 'Service Requested',
          required: true,
          width: 100,
        },
        {
          blockType: 'textarea',
          name: 'message',
          label: 'Special Requests / Details',
          required: false,
          width: 100,
        },
      ],
    },
  ]

  for (const formData of formsData) {
    const existing = await payload.find({
      collection: 'forms',
      where: { title: { equals: formData.title } },
      limit: 1,
    })

    if (existing.docs && existing.docs.length > 0) {
      console.log(`Form "${formData.title}" already exists (ID: ${existing.docs[0].id})`)
    } else {
      const created = await payload.create({
        collection: 'forms',
        data: formData as any,
      })
      console.log(`Created CMS Form "${formData.title}" (ID: ${created.id})`)
    }
  }

  console.log('Successfully seeded all CMS Forms into Payload Forms collection!')
  process.exit(0)
}

seedCmsForms().catch((err) => {
  console.error('Error seeding CMS forms:', err)
  process.exit(1)
})

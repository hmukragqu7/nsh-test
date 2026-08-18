import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function linkPagesToForms() {
  const payload = await getPayload({ config: configPromise })

  const mappings = [
    {
      slug: 'buy-a-home',
      formTitle: 'Buy A Home Inquiry Form',
      groupKey: 'buyAHomePage',
    },
    {
      slug: 'other-inquiries',
      formTitle: 'Other Inquiries Form',
      groupKey: 'otherInquiriesPage',
    },
    {
      slug: 'trade-inquiry',
      formTitle: 'Trade Inquiry Form',
      groupKey: 'tradeInquiryPage',
    },
  ]

  for (const item of mappings) {
    const pageRes = await payload.find({
      collection: 'pages',
      where: { slug: { equals: item.slug } },
      limit: 1,
    })

    const formRes = await payload.find({
      collection: 'forms',
      where: { title: { equals: item.formTitle } },
      limit: 1,
    })

    if (pageRes.docs?.[0] && formRes.docs?.[0]) {
      const pageDoc = pageRes.docs[0] as any
      const formDoc = formRes.docs[0] as any

      const existingGroup = pageDoc[item.groupKey] || {}

      await payload.update({
        collection: 'pages',
        id: pageDoc.id,
        context: { disableRevalidate: true },
        data: {
          [item.groupKey]: {
            ...existingGroup,
            selectedForm: formDoc.id,
          },
        } as any,
      })

      console.log(`Linked Page "${item.slug}" (ID: ${pageDoc.id}) to CMS Form "${item.formTitle}" (ID: ${formDoc.id})`)
    }
  }

  console.log('Finished linking all pages to CMS Forms!')
  process.exit(0)
}

linkPagesToForms().catch((err) => {
  console.error('Error linking pages to forms:', err)
  process.exit(1)
})

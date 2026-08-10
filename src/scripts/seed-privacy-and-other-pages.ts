import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedPrivacyAndOtherPages() {
  const payload = await getPayload({ config: configPromise })

  const pagesToEnsure = [
    { title: 'Privacy Policy', slug: 'privacy-policy' },
    { title: 'Thank You', slug: 'thank-you' },
    { title: 'Trade Inquiry', slug: 'trade-inquiry' },
    { title: 'Other Inquiries', slug: 'other-inquiries' },
    { title: 'Buy A Home', slug: 'buy-a-home' },
  ]

  for (const pageItem of pagesToEnsure) {
    const existing = await payload.find({
      collection: 'pages',
      where: {
        slug: {
          equals: pageItem.slug,
        },
      },
      limit: 1,
    })

    if (!existing.docs || existing.docs.length === 0) {
      console.log(`Creating page: "${pageItem.title}" (slug: ${pageItem.slug})...`)
      await payload.create({
        collection: 'pages',
        context: {
          disableRevalidate: true,
        },
        data: {
          title: pageItem.title,
          slug: pageItem.slug,
          _status: 'published',
        } as any,
      })
      console.log(`Successfully created page: "${pageItem.title}"`)
    } else {
      console.log(`Page "${pageItem.title}" already exists (id: ${existing.docs[0].id})`)
    }
  }

  console.log('Finished seeding missing pages into Pages collection.')
  process.exit(0)
}

seedPrivacyAndOtherPages().catch((err) => {
  console.error('Error seeding pages:', err)
  process.exit(1)
})

import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedPropertiesPage() {
  const payload = await getPayload({ config: configPromise })

  console.log('Checking for Properties page in Pages collection...')
  const existingPages = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'properties',
      },
    },
    limit: 1,
  })

  if (existingPages.docs && existingPages.docs.length > 0) {
    console.log('Properties page already exists in Pages collection ID:', existingPages.docs[0].id)
  } else {
    console.log('Creating Properties page in Pages collection...')
    const newPage = await payload.create({
      collection: 'pages',
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'Properties',
        slug: 'properties',
        publishedAt: new Date().toISOString(),
      } as any,
    })
    console.log('Successfully created Properties page with ID:', newPage.id)
  }

  process.exit(0)
}

seedPropertiesPage().catch((err) => {
  console.error('Error seeding properties page:', err)
  process.exit(1)
})

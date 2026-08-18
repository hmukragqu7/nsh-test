import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function populateAllPages() {
  const payload = await getPayload({ config: configPromise })

  console.log('Populating Properties Page in Pages collection...')
  const propertiesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'properties',
      },
    },
    limit: 1,
  })

  const propertiesDoc = propertiesResult.docs?.[0]
  if (propertiesDoc) {
    console.log(`Updating Properties page ID: ${propertiesDoc.id}...`)
    await payload.update({
      collection: 'pages',
      id: propertiesDoc.id,
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'Properties',
        propertiesPageHeader: {
          title: 'Luxury Homes For Sale In Texas',
          description:
            "Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection.",
          sectionHeading: 'Our Properties',
        },
      } as any,
    })
    console.log('Successfully updated Properties page in Payload CMS database!')
  }

  process.exit(0)
}

populateAllPages().catch((err) => {
  console.error('Error populating pages:', err)
  process.exit(1)
})

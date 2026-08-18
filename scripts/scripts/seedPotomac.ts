import { getPayload } from 'payload'
import configPromise from '../payload.config'

async function seedPotomac() {
  const payload = await getPayload({ config: configPromise })

  // Check if potomac property exists
  const existing = await payload.find({
    collection: 'properties',
    where: {
      slug: {
        equals: 'potomac',
      },
    },
  })

  let potomacId: string | number

  const potomacData = {
    name: 'Potomac Dr, Houston, Texas, 77057',
    slug: 'potomac',
    address: 'Potomac Dr, Houston, Texas 77057',
    price: '$2,450,000 - $3,950,000',
    description:
      'Welcome to Potomac Dr Community, featuring luxury single-family residential homes in the heart of Houston, Texas.',
    isGroupParent: true,

    // Video section (YouTube)
    video: {
      videoType: 'youtube' as const,
      youtubeUrl: 'https://www.youtube.com/watch?v=iDv2I89i8QY',
    },

    // Community Content Tab
    projectTeam: {
      brokerName: 'Casey Charles',
      builderName: 'Gifford Construction',
      architectName: 'Todd Rice',
      interiorDesignerName: 'Kevin Spearman',
    },
    aboutSection: {
      aboutTitle: 'About Potomac Dr',
      aboutIntro:
        'Nestled in the leafy charm of Potomac Dr in Houston, Texas, this newly developed luxury home offers a rare blend of refined design and everyday indulgence. Thoughtfully positioned to embrace its natural surroundings, this property is a study in balance -where clean lines meet soulful warmth.',
      historyText:
        'Rooted in one of Houston’s most established residential pockets, blending heritage, modernity, and luxury.',
      lifestyleText:
        'Life at Potomac Dr unfolds with quiet elegance, serene surroundings, and effortless connectivity to nearby trails, artisan cafes, and fine dining.',
      neighborhoodText:
        'Perfectly positioned near premier schools, fine dining, and major transit routes while maintaining privacy and connection to nature.',
    },
    neighborhoodAccordion: [
      { title: 'Tanglewood Park', distance: '1.0 Miles' },
      { title: 'Hike And Bike Trail', distance: '0.5 Miles' },
      { title: 'Galleria Mall', distance: '1.8 Miles' },
      { title: 'Memorial Park', distance: '2.2 Miles' },
    ],
    eleganceBanner: {
      title: 'Experience Elegance In Every Detail',
      description:
        'At Novel Signature Homes, we believe the essence of luxury homes lies in their details. Immerse yourself in a world of calm elegance, where thoughtful design and premium materials make each moment feel meaningfully enhanced.',
    },
  }

  if (existing.docs.length > 0) {
    potomacId = existing.docs[0].id
    console.log('Updating existing Potomac property:', potomacId)
    await payload.update({
      collection: 'properties',
      id: potomacId,
      data: potomacData,
    })
  } else {
    console.log('Creating new Potomac parent property...')
    const created = await payload.create({
      collection: 'properties',
      data: potomacData,
    })
    potomacId = created.id
  }

  // Create/update Potomac sub-units (Potomac 1 - 6)
  const subUnits = [
    {
      name: 'The Potomac 1',
      slug: 'the-potomac-1',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$3,950,000',
      status: 'under_contract',
      numberOfBeds: '4',
      numberOfBaths: '6',
      acArea: '5,412',
      parentProperty: potomacId,
    },
    {
      name: 'The Potomac 2',
      slug: 'the-potomac-2',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$2,450,000',
      status: 'for_sale',
      numberOfBeds: '4',
      numberOfBaths: '7',
      acArea: '4,592',
      parentProperty: potomacId,
    },
    {
      name: 'The Potomac 3',
      slug: 'the-potomac-3',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$2,550,000',
      status: 'for_sale',
      numberOfBeds: '4',
      numberOfBaths: '7',
      acArea: '4,592',
      parentProperty: potomacId,
    },
    {
      name: 'The Potomac 4',
      slug: 'the-potomac-4',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$2,550,000',
      status: 'for_sale',
      numberOfBeds: '4',
      numberOfBaths: '7',
      acArea: '4,592',
      parentProperty: potomacId,
    },
    {
      name: 'The Potomac 5',
      slug: 'the-potomac-5',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$2,550,000',
      status: 'for_sale',
      numberOfBeds: '4',
      numberOfBaths: '7',
      acArea: '4,592',
      parentProperty: potomacId,
    },
    {
      name: 'The Potomac 6',
      slug: 'the-potomac-6',
      address: 'Potomac Dr, Houston, TX 77057',
      price: '$3,950,000',
      status: 'for_sale',
      numberOfBeds: '4',
      numberOfBaths: '6',
      acArea: '5,412',
      parentProperty: potomacId,
    },
  ]

  for (const unit of subUnits) {
    const unitExisting = await payload.find({
      collection: 'properties',
      where: {
        slug: { equals: unit.slug },
      },
    })

    const unitPayloadData = {
      name: unit.name,
      slug: unit.slug,
      address: unit.address,
      price: unit.price,
      status: unit.status as any,
      parentProperty: unit.parentProperty,
      isGroupParent: false,
      propertySummary: {
        numberOfBeds: unit.numberOfBeds,
        numberOfBaths: unit.numberOfBaths,
        acArea: unit.acArea,
      },
    }

    if (unitExisting.docs.length > 0) {
      console.log(`Updating sub-unit ${unit.name}...`)
      await payload.update({
        collection: 'properties',
        id: unitExisting.docs[0].id,
        data: unitPayloadData,
      })
    } else {
      console.log(`Creating sub-unit ${unit.name}...`)
      await payload.create({
        collection: 'properties',
        data: unitPayloadData,
      })
    }
  }

  console.log('Successfully seeded Potomac parent & sub-units!')
  process.exit(0)
}

seedPotomac().catch((err) => {
  console.error(err)
  process.exit(1)
})

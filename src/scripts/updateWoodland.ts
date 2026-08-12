import { getPayload } from 'payload'
import configPromise from '../payload.config'

async function updateWoodland() {
  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'properties',
    where: {
      slug: {
        equals: 'woodland',
      },
    },
  })

  const woodland = result.docs[0]
  if (!woodland) {
    console.log('Woodland property not found')
    process.exit(1)
  }

  console.log('Updating woodland property ID:', woodland.id)

  await payload.update({
    collection: 'properties',
    id: woodland.id,
    data: {
      isGroupParent: true,
      projectTeam: {
        brokerName: 'Ed Wolff',
        builderName: 'Novel Signature Homes',
        architectName: 'Todd Rice',
        interiorDesignerName: 'Steve Clifton',
      },
      aboutSection: {
        aboutTitle: 'About Woodland Heights',
        aboutIntro:
          'Nestled in the leafy charm of White Oaks Dr in Houston, Texas, this newly developed luxury home offers a rare blend of refined design and everyday indulgence. Thoughtfully positioned to embrace its natural surroundings, this property is a study in balance -where clean lines meet soulful warmth. Every finish is chosen with care, creating an atmosphere that feels both sophisticated and grounded. This is not just a residential house—this is a luxury retreat in Texas for those who value discretion, artisanship, and the quiet beauty of a life well lived.',
        historyText:
          "Rooted along the banks of the White Oak Dr Bayou, this area has gracefully evolved from a 19th-century settlement into one of Houston's most established residential pockets. Blending heritage, modernity, and luxury. It is a place where tradition endures, and nature frames every moment.",
        lifestyleText:
          'Life at White Oaks Dr unfolds with quiet elegance, generously proportioned, serene, and located for effortless connectivity. With leafy streets, nearby trails, artisan cafes and fine dining establishments, White Oak Dr offers a slower pace- ideal for those who value comfort, privacy, and convenience.',
        neighborhoodText:
          'Perfectly positioned near The Heights and Memorial Park, Woodland Heights offers access to renowned schools, fine dining, and major transit routes while being immersed in a place where community is cherished, and each pathway reflects calm, refinement, and an enduring connection to the land.',
      },
      neighborhoodAccordion: [
        { title: 'Woodland Park', distance: '1.3 Miles' },
        { title: 'Hike And Bike Trail', distance: '0.8 Miles' },
        { title: 'White Oak Dr', distance: '0 Miles' },
        { title: 'Hike And Bike Trail', distance: '0.8 Miles' },
      ],
      eleganceBanner: {
        title: 'Experience Elegance In Every Detail',
        description:
          'At Novel Signature Homes, we believe the essence of luxury homes lies in their details. Immerse yourself in a world of calm elegance, where thoughtful design and premium materials make each moment feel meaningfully enhanced.',
      },
    },
  })

  console.log('Successfully updated Woodland property with all community template content!')
  process.exit(0)
}

updateWoodland().catch((err) => {
  console.error(err)
  process.exit(1)
})

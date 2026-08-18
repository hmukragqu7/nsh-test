import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import path from 'path'
import fs from 'fs'

async function uploadAboutMedia() {
  const payload = await getPayload({ config: configPromise })
  const mediaDir = path.join(process.cwd(), 'public/media/about')

  console.log('Uploading About page files into Payload Media Collection...')

  const files = [
    { file: 'ourstorybanner.webp', alt: 'Our Story Banner' },
    { file: 'whychoose.webp', alt: 'Why Choose Novel Signature Homes' },
  ]

  const mediaMap: Record<string, any> = {}

  for (const item of files) {
    const filePath = path.join(mediaDir, item.file)
    if (!fs.existsSync(filePath)) {
      console.warn(`File not found: ${filePath}`)
      continue
    }

    const existing = await payload.find({
      collection: 'media',
      where: {
        alt: { equals: item.alt },
      },
      limit: 1,
    })

    if (existing.docs && existing.docs.length > 0) {
      console.log(`Media for ${item.alt} already exists in Payload (ID: ${existing.docs[0].id})`)
      mediaMap[item.file] = existing.docs[0]
    } else {
      console.log(`Uploading ${item.file} into Payload Media Collection...`)
      const mediaDoc = await payload.create({
        collection: 'media',
        data: {
          alt: item.alt,
        },
        filePath,
      })
      console.log(`Uploaded ${item.file} (ID: ${mediaDoc.id}, URL: ${mediaDoc.url})`)
      mediaMap[item.file] = mediaDoc
    }
  }

  // Update About page document in Pages collection
  console.log('Updating About page document with Payload Media paths...')
  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: { equals: 'about' },
    },
    limit: 1,
  })

  if (pagesResult.docs && pagesResult.docs.length > 0) {
    const aboutDoc = pagesResult.docs[0] as any
    const existingAboutData = aboutDoc.aboutPage || {}

    const updatedAboutData = {
      ...existingAboutData,
      storyTitle: existingAboutData.storyTitle || 'Our Story',
      bannerImage: mediaMap['ourstorybanner.webp']?.url || existingAboutData.bannerImage || '/media/about/ourstorybanner.webp',
      paragraph1:
        existingAboutData.paragraph1 ||
        'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.',
      paragraph2:
        existingAboutData.paragraph2 ||
        'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.',
      visionTitle: existingAboutData.visionTitle || 'Our Vision',
      visionText:
        existingAboutData.visionText ||
        'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.',
      missionTitle: existingAboutData.missionTitle || 'Our Mission',
      missionText:
        existingAboutData.missionText ||
        'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.',
      valuesTitle: existingAboutData.valuesTitle || 'Our Values',
      valuesText:
        existingAboutData.valuesText ||
        'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.',
      whyHeadingPrefix: existingAboutData.whyHeadingPrefix || 'Why Choose',
      whyHeadingMain: existingAboutData.whyHeadingMain || 'Novel Signature Homes ?',
      whySubtitle: existingAboutData.whySubtitle || 'Everyday, we work hard to make our clients’ lives better and happier.',
      whyImage: mediaMap['whychoose.webp']?.url || existingAboutData.whyImage || '/media/about/whychoose.webp',
      feature1:
        existingAboutData.feature1 ||
        'Experience the finest materials and careful attention to detail with superior craftsmanship.',
      feature2:
        existingAboutData.feature2 ||
        'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.',
      feature3:
        existingAboutData.feature3 || 'Enjoy living without compromising on elegance through luxury.',
      feature4:
        existingAboutData.feature4 ||
        'Enjoy exceptional customer care from start to finish, with our signature white-glove service.',
      contactHeading: existingAboutData.contactHeading || "Let's Find Your Dream Home Together",
    }

    await payload.update({
      collection: 'pages',
      id: aboutDoc.id,
      context: {
        disableRevalidate: true,
      },
      data: {
        aboutPage: updatedAboutData,
      } as any,
    })
    console.log('Successfully updated About page with uploaded Payload Media URLs!')
  }

  process.exit(0)
}

uploadAboutMedia().catch((err) => {
  console.error('Error uploading about media:', err)
  process.exit(1)
})

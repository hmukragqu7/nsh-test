import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedAboutPage() {
  const payload = await getPayload({ config: configPromise })

  const aboutData = {
    storyTitle: 'Our Story',
    bannerImage: '/media/about/ourstorybanner.webp',
    paragraph1:
      'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.',
    paragraph2:
      'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.',
    visionTitle: 'Our Vision',
    visionText:
      'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.',
    missionTitle: 'Our Mission',
    missionText:
      'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.',
    valuesTitle: 'Our Values',
    valuesText:
      'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.',
    whyHeadingPrefix: 'Why Choose',
    whyHeadingMain: 'Novel Signature Homes ?',
    whySubtitle: 'Everyday, we work hard to make our clients’ lives better and happier.',
    whyImage: '/media/about/whychoose.webp',
    feature1:
      'Experience the finest materials and careful attention to detail with superior craftsmanship.',
    feature2:
      'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.',
    feature3:
      'Enjoy living without compromising on elegance through luxury.',
    feature4:
      'Enjoy exceptional customer care from start to finish, with our signature white-glove service.',
    contactHeading: "Let's Find Your Dream Home Together",
  }

  console.log('Checking for About page in Pages collection...')
  const existingPages = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'about',
      },
    },
    limit: 1,
  })

  if (existingPages.docs && existingPages.docs.length > 0) {
    const pageId = existingPages.docs[0].id
    console.log(`Updating existing About page (ID: ${pageId})...`)
    await payload.update({
      collection: 'pages',
      id: pageId,
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'The Story Behind Our Homes | Novel Signature Homes',
        slug: 'about',
        aboutPage: aboutData,
      } as any,
    })
    console.log('Successfully updated About page!')
  } else {
    console.log('Creating new About page...')
    const newPage = await payload.create({
      collection: 'pages',
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'The Story Behind Our Homes | Novel Signature Homes',
        slug: 'about',
        publishedAt: new Date().toISOString(),
        aboutPage: aboutData,
      } as any,
    })
    console.log('Successfully created About page with ID:', newPage.id)
  }

  process.exit(0)
}

seedAboutPage().catch((err) => {
  console.error('Error seeding About page:', err)
  process.exit(1)
})

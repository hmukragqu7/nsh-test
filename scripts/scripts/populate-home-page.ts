import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function populateHomePage() {
  const payload = await getPayload({ config: configPromise })

  console.log('Finding home page in Pages collection...')
  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'home',
      },
    },
    limit: 1,
  })

  const homeDoc = pagesResult.docs?.[0]
  if (!homeDoc) {
    console.error('Home page document not found!')
    process.exit(1)
  }

  console.log(`Found home page document ID: ${homeDoc.id}. Updating database fields...`)

  await payload.update({
    collection: 'pages',
    id: homeDoc.id,
    context: {
      disableRevalidate: true,
    },
    data: {
      title: 'Home',
      homeHero: {
        title: 'Luxury Redefined',
        description:
          'Experience unparalleled luxury living with our meticulously crafted high-end homes',
        videoUrl: '/media/WEBSITE-1.mov',
        buttonText: 'View All Properties',
        buttonLink: '/properties',
      },
      featuredPropertiesOverride: [
        {
          name: 'The Potomac',
          details: '4 BD | AC Area: 4,500 – 5,500 Sqft',
          image: '/media/Potomac_Exterior_Updated.webp',
          href: '/properties/potomac',
        },
        {
          name: 'Heatherglen',
          details: '4 BD | AC Area: 5,366 Sqft',
          image: '/media/034.webp',
          href: '/properties/4927-heatherglen-drive-houston-texas-77096',
        },
      ],
      timelessComfort: {
        title: 'Timeless Comfort In Every Detail',
        description:
          'We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.',
        buttonText: 'About Us',
        buttonLink: '/about',
      },
      whyChooseUs: [
        {
          label: 'INDULGE',
          heading: 'In Ultimate Luxury',
          text: 'Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.',
        },
        {
          label: 'IMAGINE',
          heading: 'Your Future Home Today',
          text: 'Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.',
        },
        {
          label: 'DISCOVER',
          heading: 'Your Perfect Oasis',
          text: 'We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.',
        },
      ],
      vrTour: {
        title: 'Experience Your Future Home',
        description:
          "Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built.",
        bannerImage: '/media/3dtour.webp',
        buttonText: 'Take a Virtual Tour',
        buttonLink: '/properties',
      },
      concierge: {
        title: 'Our Concierge Services',
        description:
          "We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless.",
        image: '/media/concierge-services.webp',
        buttonText: 'Learn More',
        buttonLink: '/concierge',
      },
      newestResidences: {
        title: 'Explore Our Newest Residences',
        description:
          'Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.',
        youtubeUrl: 'https://www.youtube.com/embed/iDv2I89i8QY?rel=0',
        subscribeLink: 'https://www.youtube.com/@NovelSignatureHomes/videos',
      },
      homeContact: {
        heading: "LET'S FIND YOUR DREAM HOME TOGETHER",
      },
    },
  })

  console.log('Successfully updated home page document in Payload CMS database!')
  process.exit(0)
}

populateHomePage().catch((err) => {
  console.error('Error populating home page:', err)
  process.exit(1)
})

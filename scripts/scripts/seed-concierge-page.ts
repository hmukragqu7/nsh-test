import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedConciergePage() {
  const payload = await getPayload({ config: configPromise })

  const conciergeData = {
    hero: {
      title: 'Concierge Service',
      description:
        'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.',
      bannerImage: '/media/concierge/hero-banner.webp',
    },
    services: {
      heading: 'Our Services',
      items: [
        { title: 'Mortgage assistance', icon: '/media/concierge/loan.webp' },
        { title: 'Move In / Move out Services', icon: '/media/concierge/delivery.webp' },
        { title: 'Utility transfer', icon: '/media/concierge/documents.webp' },
        { title: 'Design consultation', icon: '/media/concierge/human-resources.webp' },
        { title: 'Furnitures & Décor selection', icon: '/media/concierge/couch.webp' },
        { title: 'Blinds and Window Treatments', icon: '/media/concierge/curtain.webp' },
        { title: 'Landscaping Services', icon: '/media/concierge/gardening.webp' },
        { title: 'Plumbing and Mechanical Maintenance', icon: '/media/concierge/tap.webp' },
        { title: 'Handyman Service', icon: '/media/concierge/wrench.webp' },
        { title: 'Project manager Support', icon: '/media/concierge/employee.webp' },
      ],
    },
    howItWorks: {
      heading: 'How it works',
      image: '/media/concierge/howitwork.webp',
      steps: [
        {
          stepNumber: '01',
          title: 'We Reach Out',
          description:
            'After purchasing your luxury home to access our exclusive concierge service, reserved only for our valued buyers.',
          icon: '/media/concierge/step1.svg',
        },
        {
          stepNumber: '02',
          title: "Let's Personalize It",
          description:
            'Tell us what matters most—your lifestyle, must-haves, and ideal timelines. We’ll collaborate to craft a customized service plan that works for you.',
          icon: '/media/concierge/step2.svg',
        },
        {
          stepNumber: '03',
          title: 'Guided Connections',
          description:
            'You’ll be introduced to our trusted network of hand-selected experts, with your concierge team guiding each step and handling the details on your behalf.',
          icon: '/media/concierge/step3.svg',
        },
        {
          stepNumber: '04',
          title: 'Enjoy the ease',
          description:
            'From move-in coordination to those last finishing touches, we make luxury living feel effortless. Welcome home.',
          icon: '/media/concierge/step4.svg',
        },
      ],
    },
    whyLoveIt: {
      heading: 'Why Homeowners Love It',
      cards: [
        {
          tag: 'EASY',
          description:
            'We simplify your transition into your new luxury home by taking care of every detail. From connecting you with trusted professionals to guiding you through essential post-purchase needs, we ensure a stress-free process',
        },
        {
          tag: 'FAST',
          description:
            'Our experienced team and reliable network deliver prompt, dependable support to keep your journey smooth and on track. We prioritize speed without compromising quality, so you can focus on enjoying your new home.',
        },
        {
          tag: 'EFFICIENT',
          description:
            'Every service we provide is designed with precision and care to save you time and effort. From start to finish, we make sure your experience is seamless, leaving no detail overlooked.',
        },
      ],
    },
    contactForm: {
      heading: "Let's Make Your Move Effortless",
      subheading:
        'Move into your dream home without the stress of endless decisions or countless hours searching for the right services.',
    },
  }

  console.log('Checking for Concierge Service page in Pages collection...')
  const existingPages = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        in: ['concierge-service', 'concierge'],
      },
    },
    limit: 1,
  })

  if (existingPages.docs && existingPages.docs.length > 0) {
    const pageId = existingPages.docs[0].id
    console.log(`Updating existing Concierge page (ID: ${pageId})...`)
    await payload.update({
      collection: 'pages',
      id: pageId,
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'Concierge Service',
        slug: 'concierge-service',
        conciergePage: conciergeData,
      } as any,
    })
    console.log('Successfully updated Concierge Service page!')
  } else {
    console.log('Creating new Concierge Service page...')
    const newPage = await payload.create({
      collection: 'pages',
      context: {
        disableRevalidate: true,
      },
      data: {
        title: 'Concierge Service',
        slug: 'concierge-service',
        publishedAt: new Date().toISOString(),
        conciergePage: conciergeData,
      } as any,
    })
    console.log('Successfully created Concierge Service page with ID:', newPage.id)
  }

  process.exit(0)
}

seedConciergePage().catch((err) => {
  console.error('Error seeding concierge page:', err)
  process.exit(1)
})

import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import path from 'path'
import fs from 'fs'

async function uploadConciergeMedia() {
  const payload = await getPayload({ config: configPromise })
  const mediaDir = path.join(process.cwd(), 'public/media/concierge')

  console.log('Uploading Concierge files into Payload Media Collection...')

  const files = [
    { file: 'hero-banner.webp', alt: 'Concierge Hero Banner' },
    { file: 'loan.webp', alt: 'Mortgage assistance' },
    { file: 'delivery.webp', alt: 'Move In / Move out Services' },
    { file: 'documents.webp', alt: 'Utility transfer' },
    { file: 'human-resources.webp', alt: 'Design consultation' },
    { file: 'couch.webp', alt: 'Furnitures & Décor selection' },
    { file: 'curtain.webp', alt: 'Blinds and Window Treatments' },
    { file: 'gardening.webp', alt: 'Landscaping Services' },
    { file: 'tap.webp', alt: 'Plumbing and Mechanical Maintenance' },
    { file: 'wrench.webp', alt: 'Handyman Service' },
    { file: 'employee.webp', alt: 'Project manager Support' },
    { file: 'howitwork.webp', alt: 'How it works illustration' },
  ]

  const mediaMap: Record<string, any> = {}

  for (const item of files) {
    const filePath = path.join(mediaDir, item.file)
    if (!fs.existsSync(filePath)) continue

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
      console.log(`Uploaded ${item.file} (ID: ${mediaDoc.id})`)
      mediaMap[item.file] = mediaDoc
    }
  }

  // Now update Concierge page document in Pages collection
  console.log('Updating Concierge page document with local Media paths...')
  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: { in: ['concierge-service', 'concierge'] },
    },
    limit: 1,
  })

  if (pagesResult.docs && pagesResult.docs.length > 0) {
    const conciergeDoc = pagesResult.docs[0]
    const conciergePageData = {
      hero: {
        title: 'Concierge Service',
        description:
          'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.',
        bannerImage: mediaMap['hero-banner.webp']?.url || '/media/concierge/hero-banner.webp',
      },
      services: {
        heading: 'Our Services',
        items: [
          { title: 'Mortgage assistance', icon: mediaMap['loan.webp']?.url || '/media/concierge/loan.webp' },
          { title: 'Move In / Move out Services', icon: mediaMap['delivery.webp']?.url || '/media/concierge/delivery.webp' },
          { title: 'Utility transfer', icon: mediaMap['documents.webp']?.url || '/media/concierge/documents.webp' },
          { title: 'Design consultation', icon: mediaMap['human-resources.webp']?.url || '/media/concierge/human-resources.webp' },
          { title: 'Furnitures & Décor selection', icon: mediaMap['couch.webp']?.url || '/media/concierge/couch.webp' },
          { title: 'Blinds and Window Treatments', icon: mediaMap['curtain.webp']?.url || '/media/concierge/curtain.webp' },
          { title: 'Landscaping Services', icon: mediaMap['gardening.webp']?.url || '/media/concierge/gardening.webp' },
          { title: 'Plumbing and Mechanical Maintenance', icon: mediaMap['tap.webp']?.url || '/media/concierge/tap.webp' },
          { title: 'Handyman Service', icon: mediaMap['wrench.webp']?.url || '/media/concierge/wrench.webp' },
          { title: 'Project manager Support', icon: mediaMap['employee.webp']?.url || '/media/concierge/employee.webp' },
        ],
      },
      howItWorks: {
        heading: 'How it works',
        image: mediaMap['howitwork.webp']?.url || '/media/concierge/howitwork.webp',
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

    await payload.update({
      collection: 'pages',
      id: conciergeDoc.id,
      context: {
        disableRevalidate: true,
      },
      data: {
        conciergePage: conciergePageData,
      } as any,
    })
    console.log('Successfully updated Concierge page with uploaded Payload Media URLs!')
  }

  process.exit(0)
}

uploadConciergeMedia().catch((err) => {
  console.error('Error uploading concierge media:', err)
  process.exit(1)
})

import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedOtherPagesContent() {
  const payload = await getPayload({ config: configPromise })

  const pagesToSeed = [
    {
      slug: 'buy-a-home',
      title: 'Buy A Home',
      data: {
        title: 'Buy A Home',
        buyAHomePage: {
          title: 'Contact Us',
          subheading: 'Buy A Home',
          description:
            'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.',
          imageUrl: '/media/buy-a-home-sales.webp',
          formAction: 'https://formspree.io/f/xbjnqkyv',
          buttonText: 'Submit',
        },
      },
    },
    {
      slug: 'other-inquiries',
      title: 'Other Inquiries',
      data: {
        title: 'Other Inquiries',
        otherInquiriesPage: {
          title: 'Contact Us',
          subheading: 'Other Inquiries',
          description:
            'Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!',
          imageUrl: '/media/other-inquiries-hero.webp',
          formAction: 'https://formspree.io/f/xbjnqkyv',
          buttonText: 'Submit',
        },
      },
    },
    {
      slug: 'trade-inquiry',
      title: 'Trade Inquiry',
      data: {
        title: 'Trade Inquiry',
        tradeInquiryPage: {
          title: 'Contact Us',
          subheading: 'Trade Inquiry',
          description:
            'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.',
          imageUrl: '/media/trade-inquiry-hero.webp',
          formAction: 'https://formspree.io/f/xbjnqkyv',
          buttonText: 'Submit',
        },
      },
    },
    {
      slug: 'thank-you',
      title: 'Thank You',
      data: {
        title: 'Thank You',
        thankYouPage: {
          title: 'Thank You',
          subheading: 'Thank You for Reaching Out',
          message: 'We have received your message and will get back to you shortly.',
          buttonText: 'Back to Home',
          buttonLink: '/',
        },
      },
    },
  ]

  for (const pageItem of pagesToSeed) {
    const existing = await payload.find({
      collection: 'pages',
      where: { slug: { equals: pageItem.slug } },
      limit: 1,
    })

    if (existing.docs && existing.docs.length > 0) {
      const doc = existing.docs[0]
      await payload.update({
        collection: 'pages',
        id: doc.id,
        context: { disableRevalidate: true },
        data: pageItem.data as any,
      })
      console.log(`Updated page: "${pageItem.title}" (ID: ${doc.id})`)
    } else {
      const created = await payload.create({
        collection: 'pages',
        context: { disableRevalidate: true },
        data: {
          slug: pageItem.slug,
          _status: 'published',
          ...pageItem.data,
        } as any,
      })
      console.log(`Created page: "${pageItem.title}" (ID: ${created.id})`)
    }
  }

  console.log('Successfully seeded content for all 4 pages into database!')
  process.exit(0)
}

seedOtherPagesContent().catch((err) => {
  console.error('Error seeding pages content:', err)
  process.exit(1)
})

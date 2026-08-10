import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import { seed } from '@/endpoints/seed'

async function seedDemoWebsite() {
  console.log('🚀 Starting Complete Payload CMS Demo Website Seeding...')
  const payload = await getPayload({ config: configPromise })

  // 1. Run core template seeding (Categories, Media, Posts, Forms, Home, Contact, Header, Footer)
  console.log('📦 Seeding core collections, pages, posts, forms & globals...')
  await seed({
    payload,
    req: {} as any,
  })

  // 2. Add Carousel Block to Home Page
  console.log('🎠 Enhancing Home Page with Carousel Block...')
  const homePageResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'home',
      },
    },
  })

  if (homePageResult.docs.length > 0) {
    const homeDoc = homePageResult.docs[0]
    const mediaDocs = await payload.find({
      collection: 'media',
      limit: 2,
    })

    const sampleMedia1 = mediaDocs.docs[0]?.id
    const sampleMedia2 = mediaDocs.docs[1]?.id || sampleMedia1

    if (sampleMedia1) {
      const carouselBlock = {
        blockName: 'Featured Highlights Carousel',
        blockType: 'carousel',
        title: 'Featured Highlights & Product Showcase',
        slides: [
          {
            image: sampleMedia1,
            heading: 'Welcome to Payload CMS 3.0',
            caption: 'Discover the power of Next.js App Router integrated natively with Payload CMS.',
          },
          {
            image: sampleMedia2,
            heading: 'Dynamic Layout Block Builder',
            caption: 'Easily reorder, add, and customize blocks on any page directly from the Admin Panel.',
          },
        ],
      }

      // Prepend Carousel block to layout
      const updatedLayout = [carouselBlock, ...(homeDoc.layout || [])]

      await payload.update({
        collection: 'pages',
        id: homeDoc.id,
        context: {
          disableRevalidate: true,
        },
        data: {
          layout: updatedLayout as any,
        },
      })
    }
  }

  // 3. Seed Role-Based Accounts (Admin, Content Editor, SEO Editor)
  console.log('👤 Seeding role-based user accounts...')
  const testUsers = [
    {
      name: 'System Admin',
      email: 'admin@example.com',
      password: 'admin123456',
      roles: ['admin'],
    },
    {
      name: 'Content Editor',
      email: 'editor@example.com',
      password: 'editor123456',
      roles: ['editor'],
    },
    {
      name: 'SEO Editor',
      email: 'seo@example.com',
      password: 'seo123456',
      roles: ['seo-editor'],
    },
  ]

  for (const user of testUsers) {
    const existing = await payload.find({
      collection: 'users',
      where: { email: { equals: user.email } },
    })

    if (existing.docs.length === 0) {
      await payload.create({
        collection: 'users',
        data: user as any,
      })
      console.log(` Created account: ${user.email} (${user.roles.join(', ')})`)
    }
  }

  console.log('\n🎉 DEMO WEBSITE SEEDED SUCCESSFULLY!')
  console.log('\n🌐 Available Pages & Features to Explore:')
  console.log('  • Home Page (with Carousel): http://localhost:3000/')
  console.log('  • Contact Page (with Form): http://localhost:3000/contact')
  console.log('  • Blog Posts Archive: http://localhost:3000/posts')
  console.log('  • Payload Admin Panel: http://localhost:3000/admin')
  console.log('\n🔑 Test Accounts:')
  console.log('  • Admin: admin@example.com / admin123456')
  console.log('  • Content Editor: editor@example.com / editor123456')
  console.log('  • SEO Editor: seo@example.com / seo123456\n')

  process.exit(0)
}

seedDemoWebsite().catch((err) => {
  console.error('❌ Error seeding demo website:', err)
  process.exit(1)
})

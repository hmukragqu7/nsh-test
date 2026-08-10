import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedDemoBlogs() {
  console.log('✍️ Seeding aligned luxury custom blogs...')
  const payload = await getPayload({ config: configPromise })

  // 1. Get an author
  const users = await payload.find({
    collection: 'users',
    limit: 1,
  })

  const authorDoc = users.docs[0]
  if (!authorDoc) {
    console.error('❌ No users found in database to act as the author. Please run seedDemoWebsite or createTestUsers first!')
    process.exit(1)
  }

  // 2. Get categories
  const categoryDocs = await payload.find({
    collection: 'categories',
    limit: 2,
  })
  const categoryIds = categoryDocs.docs.map((cat) => cat.id)

  // 3. Get sample media items
  const mediaDocs = await payload.find({
    collection: 'media',
    limit: 3,
  })

  const image1Id = mediaDocs.docs[0]?.id
  const image2Id = mediaDocs.docs[1]?.id || image1Id
  const image3Id = mediaDocs.docs[2]?.id || image1Id

  // 4. Clear existing blogs
  await payload.db.deleteMany({
    collection: 'blogs',
    req: {} as any,
    where: {},
  })

  // Clear blogs versions
  try {
    await payload.db.deleteVersions({
      collection: 'blogs',
      req: {} as any,
      where: {},
    })
  } catch (err) {
    // swallow error if versions table doesn't exist yet
  }

  const blogsToCreate = [
    {
      title: 'The Art of Transitional Cottage Design',
      slug: 'art-of-transitional-cottage-design',
      excerpt: 'Explore how we combine cozy traditional cottage aesthetics with clean, modern details to create bright, airy, and deeply peaceful custom homes.',
      heroImage: image1Id || undefined,
      publishedAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString(), // 5 days ago
      authors: [authorDoc.id],
      categories: categoryIds,
      _status: 'published',
      content: {
        root: {
          type: 'root',
          children: [
            {
              type: 'heading',
              children: [
                {
                  type: 'text',
                  text: 'Redefining the Classic Cottage for Modern Living',
                  version: 1,
                },
              ],
              tag: 'h2',
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'At Novel Signature Homes, we believe that luxury is not just about size, but also about details, charm, and the feeling of comfort. The transitional cottage design theme marries the timeless beauty of painted brick, custom millwork, and warm natural stones with the soaring ceilings, open-concept floorplans, and steel-frame window installations typical of modern design. The result is a residence that feels both grand and incredibly cozy.',
                  version: 1,
                },
              ],
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'When we designed 3224 Amherst Ave in Dallas, we adopted this transitional philosophy. We used a soft nature-inspired color palette, layering natural woods with marble countertops and choosing fixtures that add refined texture. This balanced combination provides an environment that is clean, airy, and deeply welcoming.',
                  version: 1,
                },
              ],
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          version: 1,
        },
      },
    },
    {
      title: 'Modern Mediterranean: Bridging Old World & Contemporary',
      slug: 'modern-mediterranean-old-world-contemporary',
      excerpt: 'Discover the renaissance of Mediterranean architecture: stucco walls, terracotta tile roofs, arched entryways, and modern minimal interiors.',
      heroImage: image2Id || undefined,
      publishedAt: new Date(Date.now() - 15 * 24 * 60 * 60 * 1000).toISOString(), // 15 days ago
      authors: [authorDoc.id],
      categories: categoryIds.slice(0, 1),
      _status: 'published',
      content: {
        root: {
          type: 'root',
          children: [
            {
              type: 'heading',
              children: [
                {
                  type: 'text',
                  text: 'The Soul of Mediterranean Design in Texas',
                  version: 1,
                },
              ],
              tag: 'h2',
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'Mediterranean design is deeply rooted in sun-drenched coastal aesthetics, arches, textured stucco, and seamless indoor-outdoor connections. For our modern Mediterranean designs, we preserve the traditional romantic elements like clay roofs, rustic timber beams, and curved doorways, while integrating expansive floor-to-ceiling glass panel walls and clean, minimalist kitchens.',
                  version: 1,
                },
              ],
              version: 1,
                },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'Our properties in Houston highlight this aesthetic. Terracotta elements and wrought-iron fixtures provide contrast against white plaster walls. The home flow is designed around a central private courtyard with pool, which serves as a serene retreat from the bustling city.',
                  version: 1,
                },
              ],
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          version: 1,
        },
      },
    },
    {
      title: '5 Crucial Steps in Designing Your Custom Home',
      slug: 'crucial-steps-designing-custom-home',
      excerpt: 'Building your dream home is an exciting journey. Learn the key architectural, interior design, and site coordination decisions that set a project up for success.',
      heroImage: image3Id || undefined,
      publishedAt: new Date(Date.now() - 30 * 24 * 60 * 60 * 1000).toISOString(), // 30 days ago
      authors: [authorDoc.id],
      categories: [],
      _status: 'published',
      content: {
        root: {
          type: 'root',
          children: [
            {
              type: 'heading',
              children: [
                {
                  type: 'text',
                  text: 'A Guide for Custom Build Journeys',
                  version: 1,
                },
              ],
              tag: 'h2',
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'Building custom means making hundreds of decisions. To keep the process smooth and enjoyable, we recommend focusing on five key phases: site analysis and orientation, architectural envelope design, detailed interior space planning, high-performance material selection, and smart automation coordination.',
                  version: 1,
                },
              ],
              version: 1,
            },
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  text: 'By aligning your builder, architect, and interior designer early in the process, you ensure that budget, structure, and aesthetic goals remain in perfect harmony, resulting in a residence that exceeds all expectations.',
                  version: 1,
                },
              ],
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          version: 1,
        },
      },
    },
  ]

  for (const blogData of blogsToCreate) {
    await payload.create({
      collection: 'blogs',
      context: {
        disableRevalidate: true,
      },
      data: blogData as any,
    })
    console.log(` Created blog article: "${blogData.title}"`)
  }

  console.log('✨ All Aligned Demo Blogs Seeded Successfully!')
  process.exit(0)
}

seedDemoBlogs().catch((err) => {
  console.error('❌ Error seeding blogs:', err)
  process.exit(1)
})

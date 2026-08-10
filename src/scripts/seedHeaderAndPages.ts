import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedHeaderAndPages() {
  console.log('🚀 Seeding About & Concierge pages and configuring Header Global...')
  const payload = await getPayload({ config: configPromise })

  // 1. Get sample media items for heroes
  const mediaDocs = await payload.find({
    collection: 'media',
    limit: 2,
  })
  const imageHomeId = mediaDocs.docs[0]?.id
  const image2Id = mediaDocs.docs[1]?.id || imageHomeId

  // 2. Find contact page
  const contactPages = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'contact',
      },
    },
    limit: 1,
  })
  const contactPage = contactPages.docs[0]
  if (!contactPage) {
    console.error('❌ Contact page not found! Please run seedDemoWebsite first.')
    process.exit(1)
  }

  // 3. Clear existing About and Concierge pages to ensure clean seed
  await payload.db.deleteMany({
    collection: 'pages',
    req: {} as any,
    where: {
      slug: {
        in: ['about', 'concierge'],
      },
    },
  })

  // 4. Create the About page
  console.log('👤 Creating "About" page...')
  const aboutPage = await payload.create({
    collection: 'pages',
    context: {
      disableRevalidate: true,
    },
    data: {
      title: 'About Us',
      slug: 'about',
      _status: 'published',
      hero: {
        type: 'highImpact',
        media: imageHomeId || undefined,
        richText: {
          root: {
            type: 'root',
            children: [
              {
                type: 'heading',
                tag: 'h1',
                children: [
                  {
                    type: 'text',
                    text: 'Crafting Luxury Custom Residences',
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
                    text: 'Learn how Novel Signature Homes combines absolute precision, high-performance architecture, and bespoke interior styling to build residences of enduring legacy.',
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
      layout: [
        {
          blockName: 'Philosophy & Craft',
          blockType: 'content',
          columns: [
            {
              size: 'half',
              richText: {
                root: {
                  type: 'root',
                  children: [
                    {
                      type: 'heading',
                      tag: 'h3',
                      children: [{ type: 'text', text: 'Our Philosophy', version: 1 }],
                      version: 1,
                    },
                    {
                      type: 'paragraph',
                      children: [
                        {
                          type: 'text',
                          text: 'We believe a custom home should be a work of art, designed to reflect the unique lifestyle and vision of its owner. Each project represents a collaboration between our clients, master architects, and award-winning interior designers.',
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
              size: 'half',
              richText: {
                root: {
                  type: 'root',
                  children: [
                    {
                      type: 'heading',
                      tag: 'h3',
                      children: [{ type: 'text', text: 'Artisanal Craftsmanship', version: 1 }],
                      version: 1,
                    },
                    {
                      type: 'paragraph',
                      children: [
                        {
                          type: 'text',
                          text: 'Every detail, from the hand-carved millwork to the custom-cut natural stones, is executed with absolute precision by master craftsmen who share our relentless commitment to visual and structural excellence.',
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
          ],
        },
        {
          blockName: 'CTA Section',
          blockType: 'cta',
          links: [
            {
              link: {
                type: 'custom',
                appearance: 'default',
                label: 'View Our Properties',
                url: '/properties',
              },
            },
          ],
          richText: {
            root: {
              type: 'root',
              children: [
                {
                  type: 'heading',
                  tag: 'h3',
                  children: [{ type: 'text', text: 'Ready to build your signature home?', version: 1 }],
                  version: 1,
                },
                {
                  type: 'paragraph',
                  children: [
                    {
                      type: 'text',
                      text: 'Explore our collection of custom residences or contact our design team to schedule a consultation.',
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
      ],
    },
  })

  // 5. Create the Concierge page
  console.log('🛎️ Creating "Concierge" page...')
  const conciergePage = await payload.create({
    collection: 'pages',
    context: {
      disableRevalidate: true,
    },
    data: {
      title: 'Concierge Services',
      slug: 'concierge',
      _status: 'published',
      hero: {
        type: 'highImpact',
        media: image2Id || undefined,
        richText: {
          root: {
            type: 'root',
            children: [
              {
                type: 'heading',
                tag: 'h1',
                children: [
                  {
                    type: 'text',
                    text: 'White-Glove Concierge Services',
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
                    text: 'Experience the pinnacle of luxury with turnkey relocation support, estate management, and personalized home automation concierge.',
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
      layout: [
        {
          blockName: 'Concierge Features',
          blockType: 'content',
          columns: [
            {
              size: 'half',
              richText: {
                root: {
                  type: 'root',
                  children: [
                    {
                      type: 'heading',
                      tag: 'h3',
                      children: [{ type: 'text', text: 'Estate Care & Maintenance', version: 1 }],
                      version: 1,
                    },
                    {
                      type: 'paragraph',
                      children: [
                        {
                          type: 'text',
                          text: 'Our dedicated property management team offers complete peace of mind. We oversee routine maintenance, customized landscaping, smart home diagnostics, and private security systems.',
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
              size: 'half',
              richText: {
                root: {
                  type: 'root',
                  children: [
                    {
                      type: 'heading',
                      tag: 'h3',
                      children: [{ type: 'text', text: 'Bespoke Turnkey Moving', version: 1 }],
                      version: 1,
                    },
                    {
                      type: 'paragraph',
                      children: [
                        {
                          type: 'text',
                          text: 'Moving into a Novel Signature Homes residence is entirely effortless. We provide white-glove packing, unpacking, customized utility hookups, and complete interior staging services.',
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
          ],
        },
      ],
    },
  })

  // 6. Update the Header global config
  console.log('🧭 Configuring Header menu items...')
  await payload.updateGlobal({
    slug: 'header',
    context: {
      disableRevalidate: true,
    },
    data: {
      navItems: [
        {
          link: {
            type: 'custom',
            label: 'Home',
            url: '/',
          },
        },
        {
          link: {
            type: 'custom',
            label: 'Properties',
            url: '/properties',
          },
        },
        {
          link: {
            type: 'reference',
            label: 'Concierge',
            reference: {
              relationTo: 'pages',
              value: conciergePage.id,
            },
          },
        },
        {
          link: {
            type: 'custom',
            label: 'Blogs',
            url: '/blogs',
          },
        },
        {
          link: {
            type: 'reference',
            label: 'About',
            reference: {
              relationTo: 'pages',
              value: aboutPage.id,
            },
          },
        },
        {
          link: {
            type: 'reference',
            label: 'Contact',
            reference: {
              relationTo: 'pages',
              value: contactPage.id,
            },
          },
        },
      ],
    },
  })

  console.log('✨ Header Global & Pages Seeded Successfully!')
  process.exit(0)
}

seedHeaderAndPages().catch((err) => {
  console.error('❌ Error seeding Header & Pages:', err)
  process.exit(1)
})

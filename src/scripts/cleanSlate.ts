import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function cleanSlate() {
  console.log('🧹 Starting Clean Slate Reset...')
  const payload = await getPayload({ config: configPromise })

  const collectionsToClear = [
    'pages',
    'posts',
    'categories',
    'forms',
    'form-submissions',
    'media',
  ] as const

  // 1. Clear content collections
  for (const collection of collectionsToClear) {
    try {
      console.log(`— Clearing ${collection}...`)
      await payload.db.deleteMany({
        collection,
        req: {} as any,
        where: {},
      })
      if (Boolean(payload.collections[collection]?.config?.versions)) {
        await payload.db.deleteVersions({
          collection,
          req: {} as any,
          where: {},
        })
      }
    } catch (err) {
      console.warn(`Warning clearing ${collection}:`, (err as Error).message)
    }
  }

  // 2. Clear globals header and footer nav items
  console.log('— Resetting Header & Footer globals...')
  await payload.updateGlobal({
    slug: 'header',
    context: { disableRevalidate: true },
    data: { navItems: [] },
  })
  await payload.updateGlobal({
    slug: 'footer',
    context: { disableRevalidate: true },
    data: { navItems: [] },
  })

  // 3. Ensure the 3 role-based user accounts exist
  console.log('👤 Verifying user roles and accounts...')
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
      console.log(` Created user: ${user.email} (${user.roles.join(', ')})`)
    } else {
      console.log(` Verified user: ${user.email} (${user.roles.join(', ')})`)
    }
  }

  console.log('\n✨ CLEAN SLATE RESET COMPLETED!')
  console.log('\nAll pages, posts, categories, and forms have been removed.')
  console.log('User roles, access control, and user accounts are active and ready.\n')
  console.log('🔑 Credentials:')
  console.log('  • Admin: admin@example.com / admin123456')
  console.log('  • Content Editor: editor@example.com / editor123456')
  console.log('  • SEO Editor: seo@example.com / seo123456\n')

  process.exit(0)
}

cleanSlate().catch((err) => {
  console.error('❌ Error executing clean slate reset:', err)
  process.exit(1)
})

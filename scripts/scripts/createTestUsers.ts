import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function createTestUsers() {
  console.log('Initializing Payload...')
  const payload = await getPayload({ config: configPromise })

  const usersToCreate = [
    {
      name: 'System Admin',
      email: 'admin@example.com',
      password: 'admin123456',
      roles: ['admin'] as const,
    },
    {
      name: 'Content Editor',
      email: 'editor@example.com',
      password: 'editor123456',
      roles: ['editor'] as const,
    },
    {
      name: 'SEO Editor',
      email: 'seo@example.com',
      password: 'seo123456',
      roles: ['seo-editor'] as const,
    },
  ]

  for (const userData of usersToCreate) {
    const existing = await payload.find({
      collection: 'users',
      where: {
        email: {
          equals: userData.email,
        },
      },
    })

    if (existing.docs.length > 0) {
      console.log(`User ${userData.email} already exists. Updating roles...`)
      await payload.update({
        collection: 'users',
        id: existing.docs[0].id,
        data: {
          name: userData.name,
          roles: [...userData.roles],
        },
      })
    } else {
      console.log(`Creating user ${userData.email}...`)
      await payload.create({
        collection: 'users',
        data: {
          name: userData.name,
          email: userData.email,
          password: userData.password,
          roles: [...userData.roles],
        },
      })
    }
  }

  console.log('\n✅ Created all 3 test accounts successfully!')
  process.exit(0)
}

createTestUsers().catch((err) => {
  console.error('Error creating test users:', err)
  process.exit(1)
})

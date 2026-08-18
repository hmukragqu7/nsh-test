import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function inspect() {
  const payload = await getPayload({ config: configPromise })

  console.log('--- PAGES ---')
  const pages = await payload.find({
    collection: 'pages',
    limit: 100,
  })
  console.log(JSON.stringify(pages.docs.map(p => ({ id: p.id, title: p.title, slug: p.slug })), null, 2))

  process.exit(0)
}

inspect().catch((err) => {
  console.error(err)
  process.exit(1)
})

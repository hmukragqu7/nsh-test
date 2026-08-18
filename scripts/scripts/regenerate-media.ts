import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function regenerate() {
  console.log('Initializing Payload...')
  const payload = await getPayload({ config: configPromise })

  console.log('Fetching media documents...')
  const media = await payload.find({
    collection: 'media',
    limit: 1000,
  })

  console.log(`Found ${media.totalDocs} media files. Regenerating sizes...`)

  for (const doc of media.docs) {
    try {
      console.log(`Processing: ${doc.filename} (ID: ${doc.id})`)
      
      // Update the document to force Payload to rebuild the sizes
      await payload.update({
        collection: 'media',
        id: doc.id,
        data: {
          ...doc,
        },
        overwriteExistingFiles: true,
      })
      
      console.log(`Successfully regenerated: ${doc.filename}`)
    } catch (err: any) {
      console.error(`Failed to regenerate ${doc.filename}:`, err.message)
    }
  }

  console.log('Done!')
  process.exit(0)
}

regenerate().catch((err) => {
  console.error(err)
  process.exit(1)
})

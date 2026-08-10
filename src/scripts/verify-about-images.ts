import 'dotenv/config'
import fs from 'fs'
import path from 'path'
import configPromise from '../payload.config'
import { getPayload } from 'payload'

async function auditAndUploadAllMedia() {
  const payload = await getPayload({ config: configPromise })

  const aboutMediaDir = path.join(process.cwd(), 'public/media/about')
  if (!fs.existsSync(aboutMediaDir)) {
    fs.mkdirSync(aboutMediaDir, { recursive: true })
  }

  // List of all images used on About Page:
  const aboutImages = [
    { filename: 'ourstorybanner.webp', alt: 'Our Story Banner' },
    { filename: 'whychoose.webp', alt: 'Why Choose Novel Signature Homes' },
    { filename: 'house-exterior.webp', alt: 'Luxury House Exterior' },
    { filename: 'living-room.webp', alt: 'Luxury Living Room Interior' },
  ]

  console.log('=== AUDITING ABOUT PAGE MEDIA ===')

  for (const img of aboutImages) {
    const filePath = path.join(aboutMediaDir, img.filename)
    const existsLocally = fs.existsSync(filePath)
    console.log(`Checking local file ${img.filename}: ${existsLocally ? 'EXISTS' : 'MISSING'}`)

    if (existsLocally) {
      // Check if in Payload DB
      const existingInDB = await payload.find({
        collection: 'media',
        where: {
          filename: { equals: img.filename },
        },
        limit: 1,
      })

      if (existingInDB.docs && existingInDB.docs.length > 0) {
        console.log(` Payload Media DB: EXISTS (ID: ${existingInDB.docs[0].id}, URL: ${existingInDB.docs[0].url})`)
      } else {
        console.log(` Uploading ${img.filename} into Payload Media DB...`)
        try {
          const doc = await payload.create({
            collection: 'media',
            data: { alt: img.alt },
            filePath,
          })
          console.log(` Uploaded ${img.filename} (ID: ${doc.id})`)
        } catch (e) {
          console.error(` Error uploading ${img.filename}:`, e)
        }
      }
    }
  }

  console.log('=== MEDIA AUDIT COMPLETE ===')
  process.exit(0)
}

auditAndUploadAllMedia().catch((err) => {
  console.error(err)
  process.exit(1)
})

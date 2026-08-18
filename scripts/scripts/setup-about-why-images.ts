import 'dotenv/config'
import fs from 'fs'
import path from 'path'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function main() {
  const mediaDir = path.join(process.cwd(), 'public/media/about')
  if (!fs.existsSync(mediaDir)) {
    fs.mkdirSync(mediaDir, { recursive: true })
  }

  // Source files
  const potomacSrc = path.join(process.cwd(), 'public/media/Potomac_Exterior_Updated.webp')
  const livingSrc = path.join(process.cwd(), 'public/media/034.webp')

  const houseDest = path.join(mediaDir, 'house-exterior.webp')
  const livingDest = path.join(mediaDir, 'living-room.webp')

  if (fs.existsSync(potomacSrc)) {
    fs.copyFileSync(potomacSrc, houseDest)
    console.log(`Copied ${potomacSrc} -> ${houseDest}`)
  }
  if (fs.existsSync(livingSrc)) {
    fs.copyFileSync(livingSrc, livingDest)
    console.log(`Copied ${livingSrc} -> ${livingDest}`)
  }

  // Upload to Payload Media Collection
  const payload = await getPayload({ config: configPromise })
  const filesToUpload = [
    { file: 'house-exterior.webp', alt: 'Luxury House Exterior' },
    { file: 'living-room.webp', alt: 'Luxury Living Room Interior' },
  ]

  const mediaMap: Record<string, any> = {}

  for (const item of filesToUpload) {
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
      console.log(`Media ${item.alt} already in Payload: ID ${existing.docs[0].id}`)
      mediaMap[item.file] = existing.docs[0]
    } else {
      console.log(`Uploading ${item.file} into Payload Media...`)
      const mediaDoc = await payload.create({
        collection: 'media',
        data: { alt: item.alt },
        filePath,
      })
      console.log(`Uploaded ${item.file} (ID: ${mediaDoc.id})`)
      mediaMap[item.file] = mediaDoc
    }
  }

  console.log('Setup About why choose media completed!')
  process.exit(0)
}

main().catch((err) => {
  console.error(err)
  process.exit(1)
})

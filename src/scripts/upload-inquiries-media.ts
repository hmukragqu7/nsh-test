import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import path from 'path'
import fs from 'fs'

async function uploadInquiriesMedia() {
  const payload = await getPayload({ config: configPromise })
  const mediaDir = path.join(process.cwd(), 'public/media')

  console.log('Uploading Inquiry page images into Payload Media Collection...')

  const files = [
    { file: 'buy-a-home-sales.webp', alt: 'Buy A Home Hero Image' },
    { file: 'trade-inquiry-hero.webp', alt: 'Trade Inquiry Hero Image' },
    { file: 'other-inquiries-hero.webp', alt: 'Other Inquiries Hero Image' },
  ]

  const mediaMap: Record<string, any> = {}

  for (const item of files) {
    const filePath = path.join(mediaDir, item.file)
    if (!fs.existsSync(filePath)) {
      console.warn(`File not found: ${filePath}`)
      continue
    }

    const existing = await payload.find({
      collection: 'media',
      where: {
        alt: { equals: item.alt },
      },
      limit: 1,
    })

    if (existing.docs && existing.docs.length > 0) {
      console.log(`Media for ${item.alt} already exists in Payload (ID: ${existing.docs[0].id})`)
      mediaMap[item.file] = existing.docs[0]
    } else {
      console.log(`Uploading ${item.file} into Payload Media Collection...`)
      const mediaDoc = await payload.create({
        collection: 'media',
        data: {
          alt: item.alt,
        },
        filePath,
      })
      console.log(`Uploaded ${item.file} (ID: ${mediaDoc.id}, URL: ${mediaDoc.url})`)
      mediaMap[item.file] = mediaDoc
    }
  }

  console.log('All Inquiry Media items registered in Payload Media Collection successfully!')
  process.exit(0)
}

uploadInquiriesMedia().catch((err) => {
  console.error('Error uploading inquiry media:', err)
  process.exit(1)
})

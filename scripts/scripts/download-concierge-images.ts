import fs from 'fs'
import path from 'path'
import https from 'https'

const targetDir = path.join(process.cwd(), 'public/media/concierge')

if (!fs.existsSync(targetDir)) {
  fs.mkdirSync(targetDir, { recursive: true })
}

const imageUrls = [
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/conciergebannerimage-1024x408.webp', name: 'hero-banner.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/loan.webp', name: 'loan.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/delivery.webp', name: 'delivery.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/documents.webp', name: 'documents.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/human-resources.webp', name: 'human-resources.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/couch.webp', name: 'couch.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/curtain.webp', name: 'curtain.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/gardening.webp', name: 'gardening.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/tap.webp', name: 'tap.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/wrench.webp', name: 'wrench.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/employee.webp', name: 'employee.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/1-1.svg', name: 'step1.svg' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/2-1.svg', name: 'step2.svg' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/3-1.svg', name: 'step3.svg' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/4.svg', name: 'step4.svg' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/01/howitwork.webp', name: 'howitwork.webp' },
]

async function downloadFile(url: string, destPath: string): Promise<void> {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(destPath)
    https.get(url, (response) => {
      if (response.statusCode === 301 || response.statusCode === 302) {
        if (response.headers.location) {
          return downloadFile(response.headers.location, destPath).then(resolve).catch(reject)
        }
      }
      response.pipe(file)
      file.on('finish', () => {
        file.close()
        resolve()
      })
    }).on('error', (err) => {
      fs.unlink(destPath, () => {})
      reject(err)
    })
  })
}

async function main() {
  console.log('Downloading Concierge images to:', targetDir)
  for (const item of imageUrls) {
    const dest = path.join(targetDir, item.name)
    try {
      await downloadFile(item.url, dest)
      console.log(`Successfully downloaded ${item.name}`)
    } catch (err) {
      console.error(`Failed to download ${item.name}:`, err)
    }
  }
  console.log('All downloads complete!')
  process.exit(0)
}

main()

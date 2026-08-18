import fs from 'fs'
import path from 'path'
import https from 'https'

const targetDir = path.join(process.cwd(), 'public', 'media', 'about')
if (!fs.existsSync(targetDir)) {
  fs.mkdirSync(targetDir, { recursive: true })
}

const imagesToDownload = [
  {
    url: 'https://novelsignaturehomes.com/wp-content/uploads/2024/12/ourstorybanner-1024x385.webp',
    filename: 'ourstorybanner.webp',
  },
  {
    url: 'https://novelsignaturehomes.com/wp-content/uploads/2024/12/whychoose.webp',
    filename: 'whychoose.webp',
  },
]

function downloadFile(url: string, dest: string): Promise<void> {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(dest)
    https
      .get(url, (response) => {
        if (response.statusCode !== 200) {
          file.close()
          fs.unlinkSync(dest)
          reject(new Error(`Failed to download ${url}: status code ${response.statusCode}`))
          return
        }
        response.pipe(file)
        file.on('finish', () => {
          file.close()
          console.log(`Downloaded ${url} -> ${dest}`)
          resolve()
        })
      })
      .on('error', (err) => {
        file.close()
        if (fs.existsSync(dest)) fs.unlinkSync(dest)
        reject(err)
      })
  })
}

async function main() {
  console.log('Downloading About page images...')
  for (const item of imagesToDownload) {
    const dest = path.join(targetDir, item.filename)
    try {
      await downloadFile(item.url, dest)
    } catch (err) {
      console.error(`Error downloading ${item.filename}:`, err)
    }
  }
  console.log('All About page images downloaded successfully!')
}

main()

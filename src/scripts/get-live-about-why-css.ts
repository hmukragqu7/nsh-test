import { chromium } from 'playwright'

async function main() {
  const browser = await chromium.launch({ headless: true })
  const page = await browser.newPage()
  await page.goto('https://novelsignaturehomes.com/about/', { waitUntil: 'domcontentloaded' })

  const sectionCSS = await page.evaluate(() => {
    const el = document.querySelector('.uagb-block-dd60c6d8') || document.querySelector('.about-why-choose')
    if (!el) return 'Element not found'
    
    // Get all child elements and their background images / inline styles
    const items = Array.from(el.querySelectorAll('div, section, img')).map(item => {
      const computed = window.getComputedStyle(item)
      return {
        tag: item.tagName,
        className: item.className,
        backgroundImage: computed.backgroundImage,
        backgroundColor: computed.backgroundColor,
        width: computed.width,
        height: computed.height,
        gridTemplateColumns: computed.gridTemplateColumns,
        gap: computed.gap,
        padding: computed.padding,
        margin: computed.margin
      }
    })
    return items
  })

  console.log(JSON.stringify(sectionCSS, null, 2))
  await browser.close()
}

main().catch(err => {
  console.error(err)
  process.exit(1)
})

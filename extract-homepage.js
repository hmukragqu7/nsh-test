import { chromium } from 'playwright';
import fs from 'fs';

async function main() {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  
  await page.setViewportSize({ width: 1440, height: 900 });
  
  console.log('Navigating to homepage...');
  await page.goto('https://novelsignaturehomes.com/', { waitUntil: 'networkidle' });
  
  try {
    const cookieButton = page.locator('text=Accept All');
    if (await cookieButton.isVisible()) {
      await cookieButton.click();
      console.log('Accepted cookies');
      await page.waitForTimeout(500);
    }
  } catch (e) {
    console.log('No cookie button found or error accepting:', e.message);
  }

  console.log('Extracting design tokens and styles...');
  const styles = await page.evaluate(() => {
    const getStyleOf = (el) => {
      if (!el) return null;
      const computed = window.getComputedStyle(el);
      return {
        fontFamily: computed.fontFamily,
        fontSize: computed.fontSize,
        fontWeight: computed.fontWeight,
        color: computed.color,
        backgroundColor: computed.backgroundColor,
        padding: computed.padding,
        margin: computed.margin,
        borderColor: computed.borderColor,
      };
    };

    const getBgImageOf = (el) => {
      if (!el) return null;
      const computed = window.getComputedStyle(el);
      const bgImg = computed.backgroundImage;
      if (bgImg && bgImg !== 'none') {
        const match = bgImg.match(/url\("?([^"]+)"?\)/);
        return match ? match[1] : bgImg;
      }
      return null;
    };

    const bodyStyles = window.getComputedStyle(document.body);
    
    // Find all sections and get their computed styles and background images
    const sections = Array.from(document.querySelectorAll('section, header, footer, main > div')).map(el => {
      const headings = Array.from(el.querySelectorAll('h1, h2, h3, h4, h5, h6')).map(h => ({
        tag: h.tagName.toLowerCase(),
        text: h.innerText.trim(),
        style: getStyleOf(h)
      }));
      return {
        id: el.id,
        tag: el.tagName.toLowerCase(),
        className: el.className,
        style: getStyleOf(el),
        bgImage: getBgImageOf(el),
        headings
      };
    });

    return {
      body: {
        fontFamily: bodyStyles.fontFamily,
        backgroundColor: bodyStyles.backgroundColor,
        color: bodyStyles.color,
      },
      sections
    };
  });

  console.log('Extracting section HTML and structure...');
  const pageStructure = await page.evaluate(() => {
    const mainEl = document.querySelector('main') || document.body;
    const sections = Array.from(mainEl.children)
      .filter(el => {
        const tag = el.tagName.toLowerCase();
        return tag === 'section' || tag === 'div' || tag === 'header' || tag === 'footer';
      })
      .map((el, index) => {
        const text = el.innerText ? el.innerText.trim().split('\n').filter(Boolean).slice(0, 10) : [];
        const classes = el.className;
        const id = el.id;
        const tag = el.tagName.toLowerCase();
        
        const headings = Array.from(el.querySelectorAll('h1, h2, h3, h4, h5, h6')).map(h => ({
          tag: h.tagName.toLowerCase(),
          text: h.innerText.trim(),
          classes: h.className,
        }));

        const images = Array.from(el.querySelectorAll('img')).map(img => ({
          src: img.src,
          alt: img.alt,
          classes: img.className,
        }));

        const buttons = Array.from(el.querySelectorAll('a, button')).map(b => ({
          text: b.innerText.trim(),
          href: b.tagName.toLowerCase() === 'a' ? b.href : null,
          classes: b.className,
        }));

        return {
          index,
          tag,
          id,
          classes,
          headings,
          images,
          buttons,
          sampleText: text.slice(0, 10),
        };
      });

    return {
      title: document.title,
      sections,
    };
  });

  const data = {
    styles,
    pageStructure,
  };

  fs.writeFileSync('novel-homepage-data.json', JSON.stringify(data, null, 2));
  console.log('Successfully wrote data to novel-homepage-data.json');
  await browser.close();
}

main().catch(console.error);

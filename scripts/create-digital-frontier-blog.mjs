// Script: create digital-frontier blog
// Run: node scripts/create-digital-frontier-blog.mjs

import fs from 'fs';
import path from 'path';
import https from 'https';
import http from 'http';

const API = 'http://localhost:3000/api';
const MEDIA_DIR = '/home/novel/my-payload-app/public/media';

const IMAGES = [
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2026/01/ezgif.com-webp-maker-4-1024x576.webp', filename: 'digital-frontier-hero.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2026/01/ezgif.com-webp-maker-4-1-1024x576.webp', filename: 'digital-frontier-img1.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2026/01/ezgif.com-webp-maker-3.webp', filename: 'digital-frontier-img2.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2026/01/ezgif.com-webp-maker-5.webp', filename: 'digital-frontier-img3.webp' },
];

function download(url, dest) {
  return new Promise((resolve, reject) => {
    if (fs.existsSync(dest)) { console.log('  already exists:', path.basename(dest)); return resolve(); }
    const file = fs.createWriteStream(dest);
    const mod = url.startsWith('https') ? https : http;
    mod.get(url, res => {
      if (res.statusCode === 301 || res.statusCode === 302) {
        file.close(); fs.unlinkSync(dest);
        return download(res.headers.location, dest).then(resolve).catch(reject);
      }
      res.pipe(file);
      file.on('finish', () => { file.close(); resolve(); });
    }).on('error', e => { fs.unlinkSync(dest); reject(e); });
  });
}

async function uploadMedia(token, filename) {
  const filepath = path.join(MEDIA_DIR, filename);
  const data = fs.readFileSync(filepath);
  const boundary = '----FormBoundary' + Date.now();
  const body = Buffer.concat([
    Buffer.from(`--${boundary}\r\nContent-Disposition: form-data; name="file"; filename="${filename}"\r\nContent-Type: image/webp\r\n\r\n`),
    data,
    Buffer.from(`\r\n--${boundary}--\r\n`)
  ]);
  const res = await fetch(`${API}/media`, {
    method: 'POST',
    headers: { 'Authorization': `JWT ${token}`, 'Content-Type': `multipart/form-data; boundary=${boundary}` },
    body
  });
  const json = await res.json();
  if (json.doc?.id) { console.log('  uploaded:', filename, '→ ID', json.doc.id); return json.doc.id; }
  if (json.errors) throw new Error(JSON.stringify(json.errors));
  // may already exist - search by filename
  const search = await fetch(`${API}/media?where[filename][equals]=${filename}&limit=1`, { headers: { 'Authorization': `JWT ${token}` } });
  const sj = await search.json();
  if (sj.docs?.[0]) { console.log('  found existing:', filename, '→ ID', sj.docs[0].id); return sj.docs[0].id; }
  throw new Error('Could not upload or find: ' + filename);
}

// Lexical helpers
const t = (str, fmt = 0) => ({ type:'text', detail:0, format:fmt, mode:'normal', style:'', text:str, version:1 });
const b = str => t(str, 1);
const para = (...ch) => ({ type:'paragraph', format:'', indent:0, version:1, children:ch.flat(), direction:'ltr', textFormat:0, textStyle:'' });
const h3 = (...ch) => ({ type:'heading', tag:'h3', format:'', indent:0, version:1, children:ch.flat(), direction:'ltr', textFormat:0, textStyle:'' });
const li = (...ch) => ({ type:'listitem', value:1, checked:undefined, indent:0, version:1, children:ch.flat(), direction:'ltr' });
const ul = (...items) => ({ type:'list', listType:'bullet', start:1, tag:'ul', format:'', indent:0, version:1, children:items, direction:'ltr' });
const img = (mediaId) => ({ type:'upload', version:1, format:'', relationTo:'media', value:{ id: mediaId }, fields:{} });

function buildContent(ids) {
  const [heroId, img1Id, img2Id, img3Id] = ids;
  return {
    root: {
      type:'root', format:'', indent:0, version:1, direction:'ltr',
      children: [
        para(t("Houston's luxury real estate market now generates an estimated $5.7 billion in economic activity. Sales of homes priced above $1 million have jumped 65 percent year over year. However, this growth goes beyond oil wealth or corporate relocations. Instead, technology is reshaping how high-end homes are discovered, evaluated, and purchased.")),
        img(img1Id),
        h3(t('Why Houston Leads the Innovation')),
        para(t("Houston stands out because of who its buyers are. The city attracts energy executives, medical professionals, and aerospace engineers. These buyers already work with simulations, data modeling, and AI every day. For them, touring a $3 million home through VR feels intuitive, not experimental.")),
        para(t("At the same time, mortgage rates averaged around 6.4 percent in late 2025. Because of this, buyers have become more selective. They rely on technology to filter out homes that do not meet their exact needs. Rather than spending weekends on unnecessary showings, they use digital tools to focus only on properties that truly fit.")),
        h3(t('The Economics of Virtual Precision')),
        para(t('In luxury real estate, the real cost often lies in wasted time and costly mistakes. Technology directly addresses both.')),
        ul(
          li(b('Time Savings:'), t(' Traditional home searches can consume over 60 hours for high-earning professionals. Virtual tours eliminate unnecessary visits and accelerate decision-making.')),
          li(b('Preventing Change Orders:'), t(' Construction change orders in luxury homes typically add 15 to 20 percent to contract values. VR allows buyers to test layouts, finishes, and even kitchen island configurations before construction begins. This foresight can save hundreds of thousands of dollars.')),
          li(b('Market Performance:'), t(' Listings with virtual tours sell for about 9 percent more and close 31 percent faster. Meanwhile, augmented reality applications now deliver ROI figures exceeding 400 percent.'))
        ),
        img(img2Id),
        h3(t('High-Tech Tools Moving the Market')),
        para(t("Today's VR tools extend far beyond static images or basic walkthroughs. Instead, they deliver immersive, decision-driven experiences.")),
        para(t('Buyers can now:')),
        ul(
          li(b('Test light and sound'), t(', seeing how sunlight moves across rooms or how acoustics perform in a home theater')),
          li(b('Customize instantly'), t(', swapping flooring, fixtures, or furniture in real time using AR')),
          li(b('Evaluate future value'), t(', as predictive analytics estimate resale appeal and long-term climate impact over decades'))
        ),
        h3(t('Neighborhood-Specific Tech Approaches')),
        para(t('Luxury neighborhoods across Houston use technology differently, depending on lifestyle priorities.')),
        ul(
          li(b('Established Neighborhoods:'), t(' In River Oaks and Tanglewood, VR highlights soaring ceilings, craftsmanship, and architectural depth that traditional photography often flattens.')),
          li(b('Family-Centric Communities: '), t('In Memorial and West University Place, technology simulates daily routines. Parents test school traffic patterns, backyard visibility, and overall flow for busy schedules.')),
          li(b('Professional Proximity zones:'), t(' Near the Medical Center and Museum District, agents emphasize efficiency. Virtual tools showcase optimized layouts, seamless work-from-home setups, and short commute advantages.')),
          li(b('Renovation & Heritage Opportunities:'), t(' In neighborhoods like the Heights, VR helps buyers visualize modern updates inside historic homes. This removes uncertainty and preserves emotional connection to original architecture.'))
        ),
        img(img3Id),
        h3(t('The New Standard of Trust')),
        para(t('Technology does not remove the human element from luxury transactions. Instead, it strengthens trust and clarity. Today\'s top agents act as technology-enabled advisors. They guide buyers who already understand a home before stepping inside.')),
        para(t('After multiple virtual walkthroughs and scenario testing, buyers enter the closing phase confident and informed. That confidence reduces friction and accelerates decisions.')),
        para(t('Meanwhile, the global AR real estate market is approaching $2.6 billion by 2025. Houston continues to capture a disproportionate share of that growth. Buying a luxury home now mirrors the process of commissioning a custom jet. Every detail is evaluated, refined, and confirmed before construction begins.')),
        para(t('Ultimately, the standard has changed. A beautiful home is no longer enough. Buyers now expect the ability to step inside their vision instantly.')),
        para(t('Your next home is not just a physical space. It is a digital experience, shaped and perfected before the foundation is poured. Through VR, every corner aligns with your expectations. When construction begins, the result feels less like a surprise and more like a promise fulfilled.')),
      ]
    }
  };
}

async function run() {
  // Login
  const loginRes = await fetch(`${API}/users/login`, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({ email:'admin@example.com', password:'admin123456' }) });
  const { token } = await loginRes.json();
  if (!token) throw new Error('Login failed');
  console.log('✓ Logged in');

  // Download images
  console.log('\nDownloading images...');
  for (const img of IMAGES) {
    const dest = path.join(MEDIA_DIR, img.filename);
    console.log(' ↓', img.filename);
    await download(img.url, dest);
  }

  // Upload to media
  console.log('\nUploading to Payload media...');
  const ids = [];
  for (const img of IMAGES) {
    const id = await uploadMedia(token, img.filename);
    ids.push(id);
  }
  const [heroId, img1Id, img2Id, img3Id] = ids;
  console.log('Media IDs:', { heroId, img1Id, img2Id, img3Id });

  // Check if blog exists
  const slug = 'the-digital-frontier-houstons-5-7-billion-luxury-real-estate-evolution';
  const listRes = await fetch(`${API}/blogs?limit=50&depth=0`, { headers:{ 'Authorization': `JWT ${token}` } });
  const listJson = await listRes.json();
  const existing = listJson.docs?.find(b => b.slug === slug);

  const blogData = {
    title: "The Digital Frontier: Houston's $5.7 Billion Luxury Real Estate Evolution",
    slug,
    excerpt: "Explore how The Digital Frontier is transforming Houston's luxury real estate market with innovative technology and new buyer behaviors.",
    heroImage: heroId,
    publishedAt: '2026-01-05T10:06:10.000Z',
    readingTime: 4,
    _status: 'published',
    content: buildContent(ids),
  };

  let result;
  if (existing) {
    console.log('\nUpdating existing blog ID:', existing.id);
    const r = await fetch(`${API}/blogs/${existing.id}`, { method:'PATCH', headers:{'Content-Type':'application/json','Authorization':`JWT ${token}`}, body: JSON.stringify(blogData) });
    result = await r.json();
  } else {
    console.log('\nCreating new blog...');
    const r = await fetch(`${API}/blogs`, { method:'POST', headers:{'Content-Type':'application/json','Authorization':`JWT ${token}`}, body: JSON.stringify(blogData) });
    result = await r.json();
  }

  if (result.errors) throw new Error(JSON.stringify(result.errors, null, 2));
  console.log('✓ Blog saved! ID:', result.doc?.id, 'Slug:', slug);
  console.log('✓ Visit: http://localhost:3000/blogs/' + slug);
}

run().catch(e => { console.error(e); process.exit(1); });

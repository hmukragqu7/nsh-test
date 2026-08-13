// Script: create real-estate-vs-stock-market blog
// Run: node scripts/create-realestate-vs-stocks-blog.mjs

import fs from 'fs';
import path from 'path';
import https from 'https';
import http from 'http';

const API = 'http://localhost:3000/api';
const MEDIA_DIR = '/home/novel/my-payload-app/public/media';

const IMAGES = [
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/12/Gemini_Generated_Image_c92x5pc92x5pc92x-2-e1764918746831.png', filename: 'restock-hero.png' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/12/Gemini_Generated_Image_c92x5pc92x5pc92x-ezgif.com-crop.webp', filename: 'restock-img1.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/12/Gemini_Generated_Image_xm2v8exm2v8exm2v-ezgif.com-crop.webp', filename: 'restock-img2.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/12/Gemini_Generated_Image_f5wwawf5wwawf5ww-ezgif.com-crop.webp', filename: 'restock-img3.webp' },
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
    }).on('error', e => { try { fs.unlinkSync(dest); } catch {} reject(e); });
  });
}

async function uploadMedia(token, filename) {
  const filepath = path.join(MEDIA_DIR, filename);
  const data = fs.readFileSync(filepath);
  const ext = path.extname(filename).slice(1);
  const mime = ext === 'png' ? 'image/png' : 'image/webp';
  const boundary = '----FormBoundary' + Date.now();
  const body = Buffer.concat([
    Buffer.from(`--${boundary}\r\nContent-Disposition: form-data; name="file"; filename="${filename}"\r\nContent-Type: ${mime}\r\n\r\n`),
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
  const search = await fetch(`${API}/media?where[filename][equals]=${filename}&limit=1`, { headers: { 'Authorization': `JWT ${token}` } });
  const sj = await search.json();
  if (sj.docs?.[0]) { console.log('  found existing:', filename, '→ ID', sj.docs[0].id); return sj.docs[0].id; }
  throw new Error('Could not upload or find: ' + filename + ' ' + JSON.stringify(json));
}

// Lexical helpers
const t = (str, fmt = 0) => ({ type:'text', detail:0, format:fmt, mode:'normal', style:'', text:str, version:1 });
const b = str => t(str, 1);
const para = (...ch) => ({ type:'paragraph', format:'', indent:0, version:1, children:ch.flat(), direction:'ltr', textFormat:0, textStyle:'' });
const h3 = (...ch) => ({ type:'heading', tag:'h3', format:'', indent:0, version:1, children:ch.flat(), direction:'ltr', textFormat:0, textStyle:'' });
const ul = (...items) => ({ type:'list', listType:'bullet', start:1, tag:'ul', format:'', indent:0, version:1, children:items, direction:'ltr' });
const li = (...ch) => ({ type:'listitem', value:1, checked:undefined, indent:0, version:1, children:ch.flat(), direction:'ltr' });
const img = (mediaId) => ({ type:'upload', version:1, format:'', relationTo:'media', value:{ id: mediaId }, fields:{} });

function buildContent([heroId, img1Id, img2Id, img3Id]) {
  return {
    root: {
      type:'root', format:'', indent:0, version:1, direction:'ltr',
      children: [
        para(t('Both stocks and real estate have a place in a well-balanced portfolio. But if your goal is long-term stability, inflation protection, and an asset you can experience, real estate often stands out. Here is why, supported by recent market trends.')),
        img(img1Id),
        h3(t('A Real Asset With Real Scarcity')),
        para(t('A home offers something stocks never will. It is tangible, limited, and supported by everyday demand.')),
        para(t('Houston home values have seen meaningful growth over the past decade. One report notes that median prices in key Houston neighborhoods rose up to 86 percent between 2014 and 2023 (CultureMap Houston). Even in a rate-driven market, prices have held steady rather than falling.')),
        para(t('Across the Houston MSA, the repeat-sales home price index rose from 404.13 to 408.65 between Q2 and Q3 of 2025 (Federal Reserve Bank of St. Louis), reflecting steady, measured growth.')),
        para(t('Real estate often strengthens during inflation because construction costs rise, land remains limited, and buyers continue to prioritize well-located homes. Even when stocks fluctuate, properties in strong neighborhoods tend to hold their value.')),
        h3(t('An Asset That Can Earn While It Appreciates')),
        para(t('Real estate carries an advantage that stocks cannot match. It can earn income while it grows.')),
        para(t('In Houston:')),
        ul(
          li(t('Short-term rentals average roughly 59 percent occupancy based on 2024–2025 data from Airbtics')),
          li(t('Furnished rentals perform well near major employment centers and medical districts')),
          li(t('Corporate and executive housing maintains consistent demand driven by workforce mobility'))
        ),
        para(t('This rental stability continues regardless of daily market performance, because it is tied to lifestyle, relocation, and quality-of-life needs.')),
        img(img2Id),
        h3(t('Real Tax Advantages That Support Long-Term Planning')),
        para(t('Real estate offers meaningful tax advantages that traditional equities do not. Depending on your situation, you may benefit from depreciation, mortgage interest deductions, operational expense deductions, or 1031 exchange deferrals.')),
        para(t('While tax benefits vary for each person, property ownership generally provides more flexibility and long-term planning opportunities than stock investments.')),
        h3(t('Less Liquidity, More Stability')),
        para(t('Real estate cannot be sold instantly, and that can be an advantage.')),
        para(t('Stocks can move sharply in a single trading session. Home values shift gradually over time. This slower pace helps investors stay grounded and prevents reactive decision-making during volatile periods.')),
        para(t('For many, real estate creates a natural path to patient, long-term wealth building.')),
        img(img3Id),
        h3(t('A Lifestyle Asset With Legacy Value')),
        para(t('A home offers financial value, but it also offers something deeply personal. It can be lived in, shared, and passed down.')),
        para(t('Neighborhoods such as Woodland Heights, Heatherglen, The Heights, and Near Northside continue to attract long-term buyers because they combine character, walkable communities, thoughtful design, and everyday convenience. These are qualities financial markets cannot replicate.')),
        para(t('A property becomes a place for gathering, unwinding, and creating memories. When an asset blends emotional and financial value, it naturally becomes part of a stable wealth-building strategy.')),
        h3(t('The Value That Stays With You')),
        para(t('A home grows with you. It adapts to different seasons of life and holds its purpose across time. With its steady performance, lifestyle comfort, and proven resilience, real estate remains one of the most trusted avenues for building long-term wealth.')),
        h3(t('Exploring Homes in Houston')),
        para(t('If real estate is part of your plans for 2025, we can help you explore neighborhoods and homes that align with your lifestyle and long-term goals.')),
      ]
    }
  };
}

async function run() {
  const loginRes = await fetch(`${API}/users/login`, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({ email:'admin@example.com', password:'admin123456' }) });
  const { token } = await loginRes.json();
  if (!token) throw new Error('Login failed');
  console.log('✓ Logged in');

  console.log('\nDownloading images...');
  for (const img of IMAGES) {
    console.log(' ↓', img.filename);
    await download(img.url, path.join(MEDIA_DIR, img.filename));
  }

  console.log('\nUploading to Payload media...');
  const ids = [];
  for (const img of IMAGES) ids.push(await uploadMedia(token, img.filename));
  console.log('Media IDs:', ids);

  const slug = 'real-estate-vs-the-stock-market-in-2025';
  const listRes = await fetch(`${API}/blogs?limit=50&depth=0`, { headers:{ 'Authorization': `JWT ${token}` } });
  const listJson = await listRes.json();
  const existing = listJson.docs?.find(b => b.slug === slug);

  const blogData = {
    title: 'Real Estate vs. the Stock Market in 2025',
    slug,
    excerpt: 'Explore the advantages of real estate vs stocks for long-term wealth. Discover why real estate can provide stability and value.',
    heroImage: ids[0],
    publishedAt: '2025-12-05T12:01:23.000Z',
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
  console.log('✓ Blog saved! ID:', result.doc?.id);
  console.log('✓ Visit: http://localhost:3000/blogs/' + slug);
}

run().catch(e => { console.error(e); process.exit(1); });

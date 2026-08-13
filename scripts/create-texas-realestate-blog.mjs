// Script: create texas-real-estate-investment-2025 blog
// Run: node scripts/create-texas-realestate-blog.mjs

import fs from 'fs';
import path from 'path';
import https from 'https';
import http from 'http';

const API = 'http://localhost:3000/api';
const MEDIA_DIR = '/home/novel/my-payload-app/public/media';

const IMAGES = [
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/09/luxurious-mediterraneanstyle-house-twilight-1-scaled.jpg', filename: 'texas-re-hero.jpg' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/09/texas-luxury-mediterranean-home-twilight.webp', filename: 'texas-re-img1.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/09/modern-texas-home-office-interior.webp', filename: 'texas-re-img2.webp' },
  { url: 'https://novelsignaturehomes.com/wp-content/uploads/2025/09/texas-real-estate-investment-growth.webp', filename: 'texas-re-img3.webp' },
];

function download(url, dest) {
  return new Promise((resolve, reject) => {
    if (fs.existsSync(dest)) { console.log('  already exists:', path.basename(dest)); return resolve(); }
    const file = fs.createWriteStream(dest);
    const mod = url.startsWith('https') ? https : http;
    mod.get(url, res => {
      if (res.statusCode === 301 || res.statusCode === 302) {
        file.close(); try { fs.unlinkSync(dest); } catch {}
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
  const mime = ext === 'jpg' ? 'image/jpeg' : 'image/webp';
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
const h2 = (...ch) => ({ type:'heading', tag:'h2', format:'', indent:0, version:1, children:ch.flat(), direction:'ltr', textFormat:0, textStyle:'' });
const ul = (...items) => ({ type:'list', listType:'bullet', start:1, tag:'ul', format:'', indent:0, version:1, children:items, direction:'ltr' });
const li = (...ch) => ({ type:'listitem', value:1, checked:undefined, indent:0, version:1, children:ch.flat(), direction:'ltr' });
const img = (mediaId) => ({ type:'upload', version:1, format:'', relationTo:'media', value:{ id: mediaId }, fields:{} });

function buildContent([heroId, img1Id, img2Id, img3Id]) {
  return {
    root: {
      type:'root', format:'', indent:0, version:1, direction:'ltr',
      children: [
        img(img1Id),
        para(t("I'll be honest, if you'd asked me a few years ago where the strongest luxury real estate markets would be in 2025, I probably wouldn't have predicted Texas would be this hot. But here we are. Not only has the market held up, it's thriving in ways that are catching a lot of people's attention.")),
        para(t("If you've been paying any attention to housing trends lately, you've probably noticed luxury homes around here aren't just keeping their value \u2013 they're steadily going up, even when other parts of the country are starting to cool off. And there are some pretty good reasons for it.")),
        h2(b("It's Not Just a Trend, It's a Shift")),
        para(t("Texas has always marched to the beat of its own drum. No state income tax, plenty of space, growing job markets, and a lifestyle people from both coasts secretly envy. But what's happening right now isn't just a momentary boom. It feels like a long-term shift in where wealth and opportunity are moving.")),
        para(t("Big names like Tesla and Oracle made headlines when they moved operations here, but what's more interesting is the ripple effect it's created. Smaller companies, investors, and families are following. And they're not looking for fixer-uppers \u2013 they want beautiful homes, large lots, walkable neighborhoods, and access to good schools and city amenities. Texas delivers that in spades.")),
        img(img2Id),
        h2(b("So, Why Now? Why 2025?")),
        para(t("Good question. It's not like Texas is a secret anymore. People have been relocating here for years. But a few things are happening right now that make this year feel different.")),
        para(t("For one, prices in other big luxury markets like California and New York have either plateaued or dipped, while Texas is still seeing healthy appreciation. Not crazy, unsustainable jumps \u2013 just steady, reliable growth. And honestly, that's exactly what most buyers and investors are looking for these days.")),
        para(t("Then there's the work-from-anywhere culture that, despite a few companies trying to reverse it, isn't going away. More people have the freedom to live where they want, and when you can pick between a cramped $4 million house in LA or a gorgeous, brand-new $2.5 million home on an acre lot in Austin\u2026 the choice gets pretty easy.")),
        para(t("And yes \u2013 the no state income tax thing still matters, probably more than ever as other states raise taxes to cover budget gaps.")),
        h2(b("Where People Are Buying")),
        para(t("The usual suspects are still leading the way:")),
        ul(
          li(t("Houston is more than just an energy town now. Healthcare, aerospace, and tech are booming too. Neighborhoods like River Oaks, Memorial Villages, and West Haven Estates are packed with big, beautiful homes and plenty of character.")),
          li(t("Austin remains one of the fastest-growing cities in the country, especially for younger, high-earning buyers. Places like Westlake Hills, Tarrytown, and Barton Creek are loaded with new builds and remodeled classics, and homes there rarely sit on the market long.")),
          li(t("Dallas is attracting both longtime locals upgrading and out-of-state buyers moving in. Preston Hollow, Highland Park, and University Park have always been prime spots, and that hasn't changed."))
        ),
        img(img3Id),
        h2(b("The Investment Angle")),
        para(t("If you're reading this purely from an investment perspective, here's the simple version: luxury homes in Texas have held up extremely well compared to other markets. Prices are up, inventory is tight, and demand hasn't cooled. Even when the broader market gets shaky, high-end homes in growth markets like these tend to weather the storm better than most.")),
        para(t("And unlike crypto or stocks, you can live in this investment, host a dinner party in it, or rent it out as a second home. Not a bad deal.")),
        h2(b("Explore Texas Luxury Living Today")),
        para(t("I'm not here to pitch you on a specific property. I just think if you've been on the fence about making a move \u2014 whether for yourself, your family, or your portfolio \u2014 2025 is a good time to take a serious look at Texas.")),
        para(t("The market's strong, the lifestyle's unbeatable, and opportunities like this don't stay on the table forever.")),
        para(t("If you're curious what's out there or just want to bounce around some ideas, drop me a message. Always happy to chat about houses, neighborhoods, or what's really happening behind the headlines.")),
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

  const slug = 'texas-real-estate-investment-2025';
  const listRes = await fetch(`${API}/blogs?limit=50&depth=0`, { headers:{ 'Authorization': `JWT ${token}` } });
  const listJson = await listRes.json();
  const existing = listJson.docs?.find(b => b.slug === slug);

  const blogData = {
    title: 'Why Does 2025 Feel Like the Right Time to Buy Luxury Real Estate in Texas',
    slug,
    excerpt: 'Why Texas Real Estate Remains a Smart Investment in 2025 — explore the growth, lifestyle, and opportunity driving luxury home sales across Houston, Austin, and Dallas.',
    heroImage: ids[0],
    publishedAt: '2025-09-05T03:12:03.000Z',
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

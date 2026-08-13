// Script to update woodland-heights blog with proper Lexical JSON content
// Run: node scripts/update-woodland-blog.mjs

const API = 'http://localhost:3000/api';
const BLOG_ID = 4;

// Media IDs (already uploaded)
const MEDIA = {
  hero: 55,       // 50-scaled.jpg
  oakBayou: 51,   // oak-bayou-1.jpg
  skyline: 52,    // magnific_houston-skyline_2923689128-1024x701.png
  whiteOak: 53,   // 2434-White-Oak-3-1024x576.png
  interior: 54,   // 01-1024x682.jpg
};

// Lexical helpers
const text = (str, format = 0) => ({
  type: 'text', detail: 0, format, mode: 'normal', style: '', text: str, version: 1
});
const bold = (str) => text(str, 1);
const italic = (str) => text(str, 2);
const boldItalic = (str) => text(str, 3);

const para = (...children) => ({
  type: 'paragraph', format: '', indent: 0, version: 1,
  children: children.flat(), direction: 'ltr', textFormat: 0, textStyle: ''
});

const heading = (tag, ...children) => ({
  type: 'heading', tag, format: '', indent: 0, version: 1,
  children: children.flat(), direction: 'ltr', textFormat: 0, textStyle: ''
});

const link = (url, ...children) => ({
  type: 'link', version: 1, indent: 0, format: '',
  fields: { url, newTab: false, linkType: 'custom' },
  children: children.flat(), direction: 'ltr'
});

const upload = (mediaId, altText = '') => ({
  type: 'upload', version: 1, format: '',
  relationTo: 'media',
  value: { id: mediaId },
  fields: { caption: null, alt: altText }
});

// Full Lexical content matching the live blog
const content = {
  root: {
    type: 'root', format: '', indent: 0, version: 1, direction: 'ltr',
    children: [

      // Intro paragraph
      para(
        text('Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.')
      ),

      // Oak Bayou image
      upload(MEDIA.oakBayou, 'Oak Bayou in Woodland Heights Houston'),

      heading('h2', bold('Why Woodland Heights Attracts a Specific Kind of Buyer')),

      para(
        text('The buyers who come to Woodland Heights are not looking for scale. They are not drawn by amenities lists or resort-style features. What they want is a neighbourhood with character that has already been established, where the architecture has a consistent grammar and the streets feel like they belong to the people who live on them.')
      ),
      para(
        text('Woodland Heights was developed in the early twentieth century as a streetcar suburb, and the bones of that era are still visible. The Craftsman bungalows, the Prairie-style homes, the generous front porches — these are original, not recreations. The neighbourhood has been maintained rather than reinvented, which is increasingly rare in a city that tends to move fast.')
      ),

      heading('h2', bold('Access Without Sacrifice')),

      para(
        text('One of the consistent draws of Woodland Heights is how much the location offers without requiring the buyer to compromise on what surrounds them.')
      ),
      para(
        text('The neighbourhood sits between '),
        link('https://www.google.com/maps/place/Heights+Mercantile', text('Heights Mercantile')),
        text(' and the Buffalo Bayou trail system. '),
        link('https://www.google.com/maps/place/Donovan+Park+Houston', text('Donovan Park')),
        text(' is walkable from most of the neighbourhood. The '),
        link('https://www.google.com/maps/place/White+Oak+Music+Hall', text('White Oak Music Hall')),
        text(' is close enough to walk to on a weekend evening. The energy of Montrose is reachable in minutes. But inside Woodland Heights itself, the streets are quiet.')
      ),

      // Skyline image
      upload(MEDIA.skyline, 'Houston skyline view from Woodland Heights'),

      heading('h2', bold('The Culture of the Neighbourhood')),

      para(
        text('Woodland Heights has an active civic association and a consistent street-level culture that is not manufactured. The neighbourhood holds a annual home tour each spring, which draws visitors who want to see the interiors of houses that rarely come to market. On weekend mornings, the park and bayou trails fill with residents who seem to actually know each other.')
      ),
      para(
        text('There is a farmers market nearby on Saturday mornings, and the commercial strips along '),
        link('https://www.google.com/maps/place/White+Oak+Drive+Houston', text('White Oak Drive')),
        text(' have the kind of independent restaurants and shops that attract a particular kind of afternoon. Every December, Lights in the Heights brings visitors in from across the city, which is a reliable indicator of how deeply the neighbourhood has established its identity beyond its own residents.')
      ),

      heading('h2', bold('Building Within a Historic Framework')),

      para(
        text('New construction in Woodland Heights is possible, and it happens. What changed in June 2011, when the City of Houston granted the neighbourhood Historic District status, is that every exterior change now requires a Certificate of Appropriateness before work can begin. The designation did not stop construction. It shaped what construction could look like.')
      ),

      heading('h2', bold('What the Historic District Rules Actually Mean')),

      para(
        text('The '),
        link('https://www.houstontx.gov/planning/HistoricPres/', text('Historic District designation from the City of Houston')),
        text(' brought enforceable standards covering setbacks, eave heights, scale, and how a building meets the street. New construction must align with the prevailing front setback of the block, originally established at 20 feet from the street. On a predominantly single-storey blockface, a two-storey home is expected to step back further to avoid overwhelming the scale of what surrounds it. Front porches, roof pitch, and material choices must be compatible in character with the existing homes, even where the design is clearly contemporary. The guidelines are not suggestions. A building that does not meet them does not receive approval.')
      ),

      heading('h2', bold('Novel Signature Homes in Woodland Heights')),

      para(
        text('The residences at '),
        link('https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-2/', text('2434 White Oak Drive')),
        text(' and '),
        link('https://novelsignaturehomes.com/properties/luxury-homes-in-woodland-height/woodland-height-1/', text('2436 White Oak Drive')),
        text(' were designed with the district standards as a starting point, not a constraint. From the street, each home reads as part of the block. The exterior forms take from the neighbourhood without copying it. Inside, the layouts open into spaces built around how people live today, with room to gather and room to step away from it.')
      ),

      // 2434 White Oak image
      upload(MEDIA.whiteOak, 'Luxury new construction home at 2434 White Oak Drive in Woodland Heights Houston by Novel Signature Homes'),

      para(
        text('The '),
        link('https://novelsignaturehomes.com/properties/1001-e-7th-1-2st-houston/', text('1001 E 7th 1/2 Street')),
        text(' residence, recently contracted, follows the same approach. Buyers who choose Woodland Heights are rarely looking for spectacle. They are looking for craft, proportion, and a home that feels settled from the moment they arrive.')
      ),

      heading('h2', bold('Why Woodland Heights Holds Its Value')),

      para(
        text('The historic protections preserve what took a century to build. Inventory stays limited because the neighbourhood is bounded on all sides and the district rules make speculative teardowns less viable. The tree canopy along the streets is the kind of thing that cannot be accelerated. It simply took time, and time cannot be replicated in a new development.')
      ),

      // Interior image
      upload(MEDIA.interior, 'Modern luxury interior of new construction home at 1001 E 7th Street Woodland Heights Houston'),

      para(
        text('What holds the neighbourhood together beyond the physical is the people who live in it. Residents here maintain their facades, attend civic association meetings, and push back when something changes the character of a block without consideration for what surrounds it. That kind of collective investment is not something a developer can manufacture or a marketing brochure can simulate.')
      ),
      para(
        text('Woodland Heights has held its identity for over a century. The homes built within it carry that history forward, whether they were built in 1920 or last year.')
      ),



    ]
  }
};

async function run() {
  // Login
  const loginRes = await fetch(`${API}/users/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email: 'admin@example.com', password: 'admin123456' })
  });
  const { token } = await loginRes.json();
  if (!token) { console.error('Login failed'); process.exit(1); }
  console.log('✓ Logged in');

  // Update blog
  const updateRes = await fetch(`${API}/blogs/${BLOG_ID}`, {
    method: 'PATCH',
    headers: { 'Content-Type': 'application/json', 'Authorization': `JWT ${token}` },
    body: JSON.stringify({
      title: 'Woodland Heights, Houston: The Neighborhood That Rewards the Right Buyer',
      excerpt: 'Just minutes from downtown, Woodland Heights feels like a different pace of Houston. The streets are shaded by mature oaks that have stood for decades. Homes sit with quiet confidence behind wide porches and defined setbacks. Nothing feels rushed, and nothing feels temporary.',
      heroImage: MEDIA.hero,
      publishedAt: '2026-05-05T12:45:53.000Z',
      readingTime: 5,
      _status: 'published',
      content
    })
  });

  const result = await updateRes.json();
  if (result.errors) {
    console.error('Update errors:', JSON.stringify(result.errors, null, 2));
    process.exit(1);
  }
  console.log('✓ Blog updated successfully! ID:', result.doc?.id || BLOG_ID);
}

run().catch(e => { console.error(e); process.exit(1); });

import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'The Story Behind Our Homes | Novel Signature Homes',
  description:
    'Get to know us! Our journey started with a passion for creating luxury homes that feel just right here in Texas. Come learn about the folks behind the brand.',
}

export default async function AboutPage() {
  const payload = await getPayload({ config: configPromise })

  // Fetch About page document from Pages collection
  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'about',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const aboutData = pageDoc?.aboutPage || {}

  // Fallbacks
  const storyTitle = aboutData.storyTitle || 'Our Story'
  const bannerImage = aboutData.bannerImage || '/media/about/ourstorybanner.webp'
  const paragraph1 =
    aboutData.paragraph1 ||
    'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.'
  const paragraph2 =
    aboutData.paragraph2 ||
    'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.'

  const visionTitle = aboutData.visionTitle || 'Our Vision'
  const visionText =
    aboutData.visionText ||
    'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.'
  const missionTitle = aboutData.missionTitle || 'Our Mission'
  const missionText =
    aboutData.missionText ||
    'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.'
  const valuesTitle = aboutData.valuesTitle || 'Our Values'
  const valuesText =
    aboutData.valuesText ||
    'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.'

  const whyHeadingPrefix = aboutData.whyHeadingPrefix || 'Why Choose'
  const whyHeadingMain = aboutData.whyHeadingMain || 'Novel Signature Homes ?'
  const whySubtitle =
    aboutData.whySubtitle || 'Everyday, we work hard to make our clients’ lives better and happier.'
  const whyImage = aboutData.whyImage || '/media/about/whychoose.webp'

  const feature1 =
    aboutData.feature1 ||
    'Experience the finest materials and careful attention to detail with superior craftsmanship.'
  const feature2 =
    aboutData.feature2 ||
    'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.'
  const feature3 =
    aboutData.feature3 || 'Enjoy living without compromising on elegance through luxury.'
  const feature4 =
    aboutData.feature4 ||
    'Enjoy exceptional customer care from start to finish, with our signature white-glove service.'

  const contactHeading = aboutData.contactHeading || "Let's Find Your Dream Home Together"

  return (
    <div style={{ backgroundColor: '#ffffff', minHeight: '100vh', color: '#1a1a1a' }}>
      {/* SECTION 1: HERO / OUR STORY */}
      <section
        className="max-width about-banner"
        style={{
          paddingTop: 'clamp(6rem, 10vh, 8.5rem)',
          paddingBottom: '60px',
          paddingLeft: '1.5rem',
          paddingRight: '1.5rem',
          backgroundColor: '#ffffff',
        }}
      >
        <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
          {/* Header Title with Underline */}
          <div
            style={{
              borderBottom: '1px solid #d1d5db',
              paddingBottom: '12px',
              marginBottom: '30px',
            }}
          >
            <h1
              style={{
                fontFamily: "'Cormorant Garamond', Georgia, serif",
                fontSize: 'clamp(2.2rem, 4vw, 3.5rem)',
                fontWeight: 500,
                color: '#1a1a1a',
                margin: 0,
                textAlign: 'left',
              }}
            >
              {storyTitle}
            </h1>
          </div>

          {/* Banner Image */}
          <div style={{ marginBottom: '2.5rem', width: '100%', overflow: 'hidden' }}>
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={bannerImage}
              alt="Our Story Banner"
              style={{
                width: '100%',
                height: 'auto',
                maxHeight: '520px',
                objectFit: 'cover',
                display: 'block',
              }}
            />
          </div>

          {/* Paragraphs */}
          <div
            style={{
              maxWidth: '1440px',
              margin: '0 auto',
              textAlign: 'left',
              display: 'flex',
              flexDirection: 'column',
              gap: '1.5rem',
              color: '#333333',
              fontFamily: "'Montserrat', sans-serif",
              fontSize: '1rem',
              lineHeight: 1.8,
            }}
          >
            <p>{paragraph1}</p>
            <p>{paragraph2}</p>
          </div>
        </div>
      </section>

      {/* SECTION 2: VISION, MISSION, VALUES */}
      <section
        className="max-width about-vision"
        style={{
          backgroundColor: '#ffffff',
          color: '#1a1a1a',
          paddingTop: '2rem',
          paddingBottom: '5rem',
          paddingLeft: '1.5rem',
          paddingRight: '1.5rem',
        }}
      >
        <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
          {/* Top Divider Margin Line */}
          <div style={{ borderTop: '1px solid #d1d5db', width: '100%', marginBottom: '50px' }} />

          {/* Cards Grid */}
          <div
            style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
              gap: '2.5rem',
            }}
          >
            {/* Vision Card */}
            <div
              style={{
                backgroundColor: '#ffffff',
                padding: '3rem 2rem',
                borderRadius: '4px',
                boxShadow: '0 10px 30px rgba(0, 0, 0, 0.06)',
                textAlign: 'center',
                border: '1px solid #f0f0f0',
              }}
            >
              <h4
                style={{
                  fontFamily: "'Cormorant Garamond', Georgia, serif",
                  fontSize: '1.85rem',
                  fontWeight: 500,
                  color: '#1a1a1a',
                  marginBottom: '1.25rem',
                  textAlign: 'center',
                }}
              >
                {visionTitle}
              </h4>
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#555555',
                  lineHeight: 1.75,
                  margin: 0,
                  textAlign: 'center',
                }}
              >
                {visionText}
              </p>
            </div>

            {/* Mission Card */}
            <div
              style={{
                backgroundColor: '#ffffff',
                padding: '3rem 2rem',
                borderRadius: '4px',
                boxShadow: '0 10px 30px rgba(0, 0, 0, 0.06)',
                textAlign: 'center',
                border: '1px solid #f0f0f0',
              }}
            >
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', Georgia, serif",
                  fontSize: '1.85rem',
                  fontWeight: 500,
                  color: '#1a1a1a',
                  marginBottom: '1.25rem',
                  textAlign: 'center',
                }}
              >
                {missionTitle}
              </h2>
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#555555',
                  lineHeight: 1.75,
                  margin: 0,
                  textAlign: 'center',
                }}
              >
                {missionText}
              </p>
            </div>

            {/* Values Card */}
            <div
              style={{
                backgroundColor: '#ffffff',
                padding: '3rem 2rem',
                borderRadius: '4px',
                boxShadow: '0 10px 30px rgba(0, 0, 0, 0.06)',
                textAlign: 'center',
                border: '1px solid #f0f0f0',
              }}
            >
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', Georgia, serif",
                  fontSize: '1.85rem',
                  fontWeight: 500,
                  color: '#1a1a1a',
                  marginBottom: '1.25rem',
                  textAlign: 'center',
                }}
              >
                {valuesTitle}
              </h2>
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#555555',
                  lineHeight: 1.75,
                  margin: 0,
                  textAlign: 'center',
                }}
              >
                {valuesText}
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* SECTION 3: WHY CHOOSE NOVEL SIGNATURE HOMES? */}
      <section
        className="max-width about-why-choose"
        style={{
          backgroundColor: '#ffffff',
          width: '100%',
          maxWidth: '100%',
          height: '85vh',
          minHeight: '85vh',
          overflowX: 'hidden',
          overflowY: 'hidden',
          padding: 0,
          margin: 0,
          display: 'flex',
          flexDirection: 'column',
        }}
      >
        {/* Top Divider Margin Line */}
        <div style={{ borderTop: '1px solid #d1d5db', width: '100%' }} />

        {/* 3-Column Flush Layout (Left: 50%, Middle: 25%, Right: 25%) */}
        <div
          style={{
            width: '100%',
            flex: 1,
            height: '100%',
            display: 'flex',
            flexWrap: 'wrap',
            alignItems: 'stretch',
          }}
        >
          {/* LEFT COLUMN (50% Width) */}
          <div
            style={{
              flex: '1 1 50%',
              minWidth: '320px',
              height: '100%',
              display: 'flex',
              flexDirection: 'column',
            }}
          >
            {/* Top Left Header Card */}
            <div
              style={{
                backgroundColor: '#ffffff',
                position: 'relative',
                padding: '3rem 2.5rem',
                flex: 1,
                height: '50%',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                overflow: 'hidden',
              }}
            >
              {/* Topography overlay */}
              <div
                style={{
                  position: 'absolute',
                  inset: 0,
                  backgroundImage: 'url("/media/topography.svg")',
                  backgroundSize: 'cover',
                  backgroundPosition: 'center',
                  opacity: 0.12,
                  pointerEvents: 'none',
                }}
              />
              <div style={{ position: 'relative', zIndex: 2 }}>
                <h2
                  style={{
                    fontFamily: "'Cormorant Garamond', Georgia, serif",
                    fontSize: 'clamp(2.5rem, 4vw, 3.5rem)',
                    fontWeight: 500,
                    color: '#1a1a1a',
                    lineHeight: 1.1,
                    margin: 0,
                  }}
                >
                  Why
                  <br />
                  Choose
                </h2>
                <h4
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 600,
                    letterSpacing: '2px',
                    color: '#333333',
                    marginTop: '1rem',
                    marginBottom: '1rem',
                    textTransform: 'uppercase',
                  }}
                >
                  {whyHeadingMain}
                </h4>
                <p
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.95rem',
                    color: '#555555',
                    lineHeight: 1.6,
                    margin: 0,
                  }}
                >
                  {whySubtitle}
                </p>
              </div>
            </div>

            {/* Bottom Left Row (2 Sub-Cards side-by-side, each 50% width) */}
            <div style={{ display: 'flex', flexWrap: 'wrap', flex: 1, height: '50%' }}>
              {/* Bottom Left 1: House Exterior Background Image */}
              <div
                style={{
                  flex: '1 1 50%',
                  minWidth: '200px',
                  height: '100%',
                  position: 'relative',
                  padding: '2rem 1.75rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  backgroundImage:
                    'linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url("/media/about/house-exterior.webp")',
                  backgroundSize: 'cover',
                  backgroundPosition: 'center',
                }}
              >
                <p
                  style={{
                    position: 'relative',
                    zIndex: 2,
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.95rem',
                    color: '#ffffff',
                    lineHeight: 1.6,
                    margin: 0,
                  }}
                >
                  {feature1}
                </p>
              </div>

              {/* Bottom Left 2: Dark Topography Background */}
              <div
                style={{
                  flex: '1 1 50%',
                  minWidth: '200px',
                  height: '100%',
                  position: 'relative',
                  padding: '2rem 1.75rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  backgroundColor: '#161616',
                }}
              >
                <div
                  style={{
                    position: 'absolute',
                    inset: 0,
                    backgroundImage: 'url("/media/topography.svg")',
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                    opacity: 0.15,
                    filter: 'invert(1)',
                    pointerEvents: 'none',
                  }}
                />
                <p
                  style={{
                    position: 'relative',
                    zIndex: 2,
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.95rem',
                    color: '#ffffff',
                    lineHeight: 1.6,
                    margin: 0,
                  }}
                >
                  {feature2}
                </p>
              </div>
            </div>
          </div>

          {/* MIDDLE TALL COLUMN (25% Width) */}
          <div
            style={{
              flex: '1 1 25%',
              minWidth: '280px',
              height: '100%',
              position: 'relative',
              overflow: 'hidden',
            }}
          >
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={whyImage}
              alt="Why Choose Novel Signature Homes"
              style={{
                width: '100%',
                height: '100%',
                objectFit: 'cover',
                display: 'block',
              }}
            />
          </div>

          {/* RIGHT COLUMN (25% Width) */}
          <div
            style={{
              flex: '1 1 25%',
              minWidth: '280px',
              height: '100%',
              display: 'flex',
              flexDirection: 'column',
            }}
          >
            {/* Top Right Card: Living Room Background Image */}
            <div
              style={{
                flex: 1,
                height: '50%',
                position: 'relative',
                padding: '2rem 1.75rem',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                backgroundImage:
                  'linear-gradient(rgba(0,0,0,0.65), rgba(0,0,0,0.65)), url("/media/about/living-room.webp")',
                backgroundSize: 'cover',
                backgroundPosition: 'center',
              }}
            >
              <p
                style={{
                  position: 'relative',
                  zIndex: 2,
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#ffffff',
                  lineHeight: 1.6,
                  margin: 0,
                }}
              >
                {feature3}
              </p>
            </div>

            {/* Bottom Right Card: Dark Topography Background */}
            <div
              style={{
                flex: 1,
                height: '50%',
                position: 'relative',
                padding: '2rem 1.75rem',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                backgroundColor: '#161616',
              }}
            >
              <div
                style={{
                  position: 'absolute',
                  inset: 0,
                  backgroundImage: 'url("/media/topography.svg")',
                  backgroundSize: 'cover',
                  backgroundPosition: 'center',
                  opacity: 0.15,
                  filter: 'invert(1)',
                  pointerEvents: 'none',
                }}
              />
              <p
                style={{
                  position: 'relative',
                  zIndex: 2,
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#ffffff',
                  lineHeight: 1.6,
                  margin: 0,
                }}
              >
                {feature4}
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* SECTION 4: CONTACT FORM */}
      <section
        id="contact"
        className="max-width about-form"
        style={{
          position: 'relative',
          backgroundColor: '#ffffff',
          color: '#1a1a1a',
          paddingTop: '3rem',
          paddingBottom: '5rem',
          paddingLeft: '1.5rem',
          paddingRight: '1.5rem',
          overflow: 'hidden',
        }}
      >
        {/* Top Divider Margin Line */}
        <div
          style={{ maxWidth: '1440px', margin: '0 auto 50px auto', borderTop: '1px solid #d1d5db' }}
        />

        {/* Topography Background Overlay */}
        <div
          style={{
            position: 'absolute',
            inset: 0,
            backgroundImage: 'url("/media/topography.svg")',
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            opacity: 0.1,
            pointerEvents: 'none',
          }}
        />

        {/* 2-Column Container */}
        <div
          style={{
            position: 'relative',
            zIndex: 2,
            maxWidth: '1440px',
            margin: '0 auto',
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))',
            gap: '4rem',
            alignItems: 'center',
          }}
        >
          {/* Left Column: Big Title */}
          <div>
            <h2
              style={{
                fontFamily: "'Cormorant Garamond', Georgia, serif",
                fontSize: 'clamp(2.4rem, 4.5vw, 3.8rem)',
                fontWeight: 500,
                lineHeight: 1.15,
                letterSpacing: '1px',
                textTransform: 'uppercase',
                color: '#1a1a1a',
                margin: 0,
              }}
            >
              LET'S FIND YOUR <span style={{ color: '#8A561F' }}>DREAM HOME</span>
              <br />
              TOGETHER
            </h2>
          </div>

          {/* Right Column: Stacked Form Fields */}
          <div>
            <form
              action="https://formspree.io/f/xbjnqkyv"
              method="POST"
              style={{
                display: 'flex',
                flexDirection: 'column',
                gap: '1.25rem',
              }}
            >
              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Name <span style={{ color: '#dc2626' }}>*</span>
                </label>
                <input
                  type="text"
                  name="name"
                  required
                  style={{
                    width: '100%',
                    height: '46px',
                    padding: '0 1rem',
                    backgroundColor: '#e9e9e9',
                    border: 'none',
                    borderRadius: '2px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Phone
                </label>
                <input
                  type="tel"
                  name="phone"
                  style={{
                    width: '100%',
                    height: '46px',
                    padding: '0 1rem',
                    backgroundColor: '#e9e9e9',
                    border: 'none',
                    borderRadius: '2px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Email <span style={{ color: '#dc2626' }}>*</span>
                </label>
                <input
                  type="email"
                  name="email"
                  required
                  style={{
                    width: '100%',
                    height: '46px',
                    padding: '0 1rem',
                    backgroundColor: '#e9e9e9',
                    border: 'none',
                    borderRadius: '2px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Message
                </label>
                <textarea
                  name="message"
                  rows={4}
                  style={{
                    width: '100%',
                    padding: '0.85rem 1rem',
                    backgroundColor: '#e9e9e9',
                    border: 'none',
                    borderRadius: '2px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    resize: 'vertical',
                    outline: 'none',
                  }}
                />
              </div>

              <button
                type="submit"
                style={{
                  backgroundColor: '#000000',
                  color: '#ffffff',
                  border: 'none',
                  padding: '0.85rem 2.2rem',
                  fontSize: '0.875rem',
                  fontWeight: 600,
                  fontFamily: "'Montserrat', sans-serif",
                  borderRadius: '2px',
                  cursor: 'pointer',
                  alignSelf: 'flex-start',
                  marginTop: '0.5rem',
                  letterSpacing: '1px',
                  textTransform: 'uppercase',
                }}
              >
                Submit
              </button>
            </form>
          </div>
        </div>
      </section>
    </div>
  )
}

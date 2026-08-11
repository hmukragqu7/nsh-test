import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import RichText from '@/components/RichText'
import { RenderBlocks } from '@/blocks/RenderBlocks'

export const metadata = {
  title: 'Sales - Novel Signature Homes',
  description:
    'Contact Us Buy A Home. Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.',
}

export default async function BuyAHomePage() {
  const payload = await getPayload({ config: configPromise })

  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'buy-a-home',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const cmsData = pageDoc?.buyAHomePage || {}
  const layoutBlocks = pageDoc?.layout || []

  const title = cmsData.title || 'Contact Us'
  const subheading = cmsData.subheading || 'Buy A Home'
  const description =
    cmsData.description ||
    'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.'

  const heroImage =
    cmsData.image && typeof cmsData.image === 'object' && cmsData.image.url
      ? cmsData.image.url
      : cmsData.imageUrl || '/media/buy-a-home-sales.webp'

  const formAction = cmsData.formAction || 'https://formspree.io/f/xbjnqkyv'
  const buttonText = cmsData.buttonText || 'Submit'

  const hasInquiryHeroInBlocks =
    Array.isArray(layoutBlocks) &&
    layoutBlocks.some((b: any) => b.blockType === 'inquiryHero')

  return (
    <div style={{ backgroundColor: '#ffffff', minHeight: '100vh', color: '#1a1a1a' }}>
      {/* MAIN SPLIT SECTION (rendered unless replaced by a dragged inquiryHero block) */}
      {!hasInquiryHeroInBlocks && (
        <section
          style={{
            display: 'flex',
            flexDirection: 'row',
            minHeight: 'calc(100vh - 80px)',
            marginTop: '80px',
            width: '100%',
          }}
          className="nsh-buy-a-home-section"
        >
        {/* LEFT COLUMN: FULL-HEIGHT LUXURY IMAGE */}
        <div
          style={{
            flex: '1 1 50%',
            width: '50%',
            position: 'relative',
            backgroundImage: `url("${heroImage}")`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            minHeight: 'calc(100vh - 80px)',
          }}
          className="nsh-buy-a-home-image"
        />

        {/* RIGHT COLUMN: CONTENT & FORM */}
        <div
          style={{
            flex: '1 1 50%',
            width: '50%',
            backgroundColor: '#ffffff',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '4rem 5rem 5rem 4rem',
            boxSizing: 'border-box',
            minHeight: 'calc(100vh - 80px)',
          }}
          className="nsh-buy-a-home-content"
        >
          <div style={{ maxWidth: '620px', width: '100%' }}>
            {/* Heading */}
            <h1
              style={{
                fontFamily: "'Cormorant Garamond', Georgia, serif",
                fontSize: 'clamp(2.2rem, 3.5vw, 3rem)',
                fontWeight: 500,
                color: '#1a1a1a',
                margin: 0,
                paddingBottom: '12px',
                borderBottom: '1px solid #1a1a1a',
                lineHeight: 1.2,
              }}
            >
              {title}
            </h1>

            {/* Subheading */}
            <h2
              style={{
                fontFamily: "'Montserrat', sans-serif",
                fontSize: '1.375rem',
                fontWeight: 500,
                color: '#9e6b27',
                marginTop: '1.75rem',
                marginBottom: '1rem',
              }}
            >
              {subheading}
            </h2>

            {/* Description */}
            <p
              style={{
                fontFamily: "'Montserrat', sans-serif",
                fontSize: '0.95rem',
                color: '#4a4a4a',
                lineHeight: 1.7,
                marginBottom: '1.5rem',
              }}
            >
              {description}
            </p>

            {/* IN-BETWEEN CUSTOM CONTENT (Text, Images, Media, Links) */}
            {cmsData.additionalContent &&
              typeof cmsData.additionalContent === 'object' &&
              cmsData.additionalContent.root && (
                <div style={{ marginBottom: '1.75rem' }}>
                  <RichText data={cmsData.additionalContent} enableGutter={false} />
                </div>
              )}

            {/* Contact Form */}
            <form
              action={formAction}
              method="POST"
              style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}
            >
              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.9rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Name<span style={{ color: 'red' }}>*</span>
                </label>
                <input
                  type="text"
                  name="name"
                  required
                  style={{
                    width: '100%',
                    height: '46px',
                    padding: '0 1rem',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.9rem',
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
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.9rem',
                    fontWeight: 500,
                    marginBottom: '0.4rem',
                    color: '#1a1a1a',
                  }}
                >
                  Email<span style={{ color: 'red' }}>*</span>
                </label>
                <input
                  type="email"
                  name="email"
                  required
                  style={{
                    width: '100%',
                    height: '46px',
                    padding: '0 1rem',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.9rem',
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
                    padding: '0.75rem 1rem',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.95rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    resize: 'vertical',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div style={{ marginTop: '0.5rem' }}>
                <button
                  type="submit"
                  className="nsh-buy-a-home-btn"
                  style={{
                    backgroundColor: '#000000',
                    color: '#ffffff',
                    border: 'none',
                    padding: '14px 44px',
                    fontSize: '0.9rem',
                    fontWeight: 600,
                    fontFamily: "'Montserrat', sans-serif",
                    borderRadius: '0px',
                    cursor: 'pointer',
                    letterSpacing: '0.5px',
                    transition: 'background-color 0.2s ease',
                  }}
                >
                  {buttonText}
                </button>
              </div>
            </form>
          </div>
        </div>
      </section>
    )}

      {/* DYNAMIC CMS LAYOUT BLOCKS */}
      {layoutBlocks && layoutBlocks.length > 0 && (
        <div style={{ marginTop: hasInquiryHeroInBlocks ? '80px' : '0px' }}>
          <RenderBlocks blocks={layoutBlocks} />
        </div>
      )}

      <style>{`
        .nsh-buy-a-home-btn:hover {
          background-color: #262626 !important;
        }
        @media (max-width: 921px) {
          .nsh-buy-a-home-section {
            flex-direction: column !important;
            min-height: auto !important;
          }
          .nsh-buy-a-home-image {
            width: 100% !important;
            min-height: 350px !important;
            height: 350px !important;
          }
          .nsh-buy-a-home-content {
            width: 100% !important;
            padding: 2.5rem 1.5rem 4rem 1.5rem !important;
          }
        }
      `}</style>
    </div>
  )
}

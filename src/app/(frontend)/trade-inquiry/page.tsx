import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import RichText from '@/components/RichText'
import { RenderBlocks } from '@/blocks/RenderBlocks'

export const metadata = {
  title: 'Trade Inquiry - Novel Signature Homes',
  description:
    'Contact Us Trade Inquiry. We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.',
}

export default async function TradeInquiryPage() {
  const payload = await getPayload({ config: configPromise })

  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'trade-inquiry',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const cmsData = pageDoc?.tradeInquiryPage || {}
  const layoutBlocks = pageDoc?.layout || []

  const title = cmsData.title || 'Contact Us'
  const subheading = cmsData.subheading || 'Trade Inquiry'
  const description =
    cmsData.description ||
    'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.'

  const heroImage =
    cmsData.image && typeof cmsData.image === 'object' && cmsData.image.url
      ? cmsData.image.url
      : cmsData.imageUrl || '/media/trade-inquiry-hero.webp'

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
          className="nsh-trade-inquiry-section"
        >
        {/* LEFT COLUMN: FULL-HEIGHT LIVING ROOM IMAGE */}
        <div
          style={{
            flex: '1 1 50%',
            width: '50%',
            position: 'relative',
            backgroundImage: `url("${heroImage}")`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            minHeight: '500px',
          }}
          className="nsh-trade-inquiry-image"
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
          }}
          className="nsh-trade-inquiry-content"
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
                  Type of Business<span style={{ color: 'red' }}>*</span>
                </label>
                <input
                  type="text"
                  name="type_of_business"
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
                  Message (optional)
                </label>
                <textarea
                  name="message"
                  rows={5}
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
                  className="nsh-trade-inquiry-btn"
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
        .nsh-trade-inquiry-btn:hover {
          background-color: #262626 !important;
        }
        @media (max-width: 921px) {
          .nsh-trade-inquiry-section {
            flex-direction: column !important;
            min-height: auto !important;
          }
          .nsh-trade-inquiry-image {
            width: 100% !important;
            min-height: 350px !important;
            height: 350px !important;
          }
          .nsh-trade-inquiry-content {
            width: 100% !important;
            padding: 2.5rem 1.5rem 4rem 1.5rem !important;
          }
        }
      `}</style>
    </div>
  )
}

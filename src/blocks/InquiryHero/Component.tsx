import React from 'react'
import RichText from '@/components/RichText'

export type InquiryHeroBlockProps = {
  title?: string
  subheading?: string
  description?: string
  image?: any
  imageUrl?: string
  additionalContent?: any
  formAction?: string
  buttonText?: string
}

export const InquiryHeroBlock: React.FC<InquiryHeroBlockProps> = (props) => {
  const {
    title = 'Contact Us',
    subheading = 'Inquiries',
    description,
    image,
    imageUrl,
    additionalContent,
    formAction = 'https://formspree.io/f/xbjnqkyv',
    buttonText = 'Submit',
  } = props

  const heroImgUrl =
    image && typeof image === 'object' && image.url
      ? image.url
      : imageUrl || '/media/other-inquiries-hero.webp'

  return (
    <div style={{ backgroundColor: '#ffffff', color: '#1a1a1a', width: '100%' }}>
      <section
        style={{
          display: 'flex',
          flexDirection: 'row',
          minHeight: '600px',
          width: '100%',
        }}
        className="nsh-inquiry-hero-block"
      >
        {/* LEFT COLUMN: HERO IMAGE */}
        <div
          style={{
            flex: '1 1 50%',
            width: '50%',
            position: 'relative',
            backgroundImage: `url("${heroImgUrl}")`,
            backgroundSize: 'cover',
            backgroundPosition: 'center',
            minHeight: '400px',
          }}
          className="nsh-inquiry-hero-img"
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
            padding: '3rem 4rem 4rem 3rem',
            boxSizing: 'border-box',
          }}
          className="nsh-inquiry-hero-content"
        >
          <div style={{ maxWidth: '620px', width: '100%' }}>
            {/* Heading */}
            {title && (
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', Georgia, serif",
                  fontSize: 'clamp(2rem, 3.5vw, 2.8rem)',
                  fontWeight: 500,
                  color: '#1a1a1a',
                  margin: 0,
                  paddingBottom: '12px',
                  borderBottom: '1px solid #1a1a1a',
                  lineHeight: 1.2,
                }}
              >
                {title}
              </h2>
            )}

            {/* Subheading */}
            {subheading && (
              <h3
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '1.25rem',
                  fontWeight: 500,
                  color: '#9e6b27',
                  marginTop: '1.5rem',
                  marginBottom: '0.85rem',
                }}
              >
                {subheading}
              </h3>
            )}

            {/* Description */}
            {description && (
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '0.95rem',
                  color: '#4a4a4a',
                  lineHeight: 1.7,
                  marginBottom: '1.25rem',
                }}
              >
                {description}
              </p>
            )}

            {/* In-between Rich Text */}
            {additionalContent &&
              typeof additionalContent === 'object' &&
              additionalContent.root && (
                <div style={{ marginBottom: '1.5rem' }}>
                  <RichText data={additionalContent} enableGutter={false} />
                </div>
              )}

            {/* Form */}
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
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.35rem',
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
                    height: '44px',
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
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.35rem',
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
                    height: '44px',
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
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.35rem',
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
                    height: '44px',
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
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '0.35rem',
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

      <style>{`
        @media (max-width: 921px) {
          .nsh-inquiry-hero-block {
            flex-direction: column !important;
            min-height: auto !important;
          }
          .nsh-inquiry-hero-img {
            width: 100% !important;
            min-height: 300px !important;
            height: 300px !important;
          }
          .nsh-inquiry-hero-content {
            width: 100% !important;
            padding: 2rem 1.5rem 3rem 1.5rem !important;
          }
        }
      `}</style>
    </div>
  )
}

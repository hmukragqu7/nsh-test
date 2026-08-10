import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'

export const metadata = {
  title: 'Concierge Service | Personalized Luxury Home Support | Novel Signature Homes',
  description:
    'Experience premium concierge services with Novel Signature Homes. From home management to personalized assistance, we ensure your luxury living is seamless, comfortable, and truly effortless.',
}

export default async function ConciergePage() {
  const payload = await getPayload({ config: configPromise })

  // Fetch Concierge page document from Pages collection
  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        in: ['concierge-service', 'concierge'],
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const conciergeData = pageDoc?.conciergePage || {}

  // Hero Section Fallbacks
  const heroTitle = conciergeData.hero?.title || 'Concierge Service'
  const heroDesc =
    conciergeData.hero?.description ||
    'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.'
  const heroBanner = conciergeData.hero?.bannerImage || '/media/concierge/hero-banner.webp'

  // Services Fallbacks
  const servicesHeading = conciergeData.services?.heading || 'Our Services'
  const servicesList = conciergeData.services?.items?.length
    ? conciergeData.services.items
    : [
        { title: 'Mortgage assistance', icon: '/media/concierge/loan.webp' },
        { title: 'Move In / Move out Services', icon: '/media/concierge/delivery.webp' },
        { title: 'Utility transfer', icon: '/media/concierge/documents.webp' },
        { title: 'Design consultation', icon: '/media/concierge/human-resources.webp' },
        { title: 'Furnitures & Décor selection', icon: '/media/concierge/couch.webp' },
        { title: 'Blinds and Window Treatments', icon: '/media/concierge/curtain.webp' },
        { title: 'Landscaping Services', icon: '/media/concierge/gardening.webp' },
        { title: 'Plumbing and Mechanical Maintenance', icon: '/media/concierge/tap.webp' },
        { title: 'Handyman Service', icon: '/media/concierge/wrench.webp' },
        { title: 'Project manager Support', icon: '/media/concierge/employee.webp' },
      ]

  // How It Works Fallbacks
  const howHeading = conciergeData.howItWorks?.heading || 'How it works'
  const howImage = conciergeData.howItWorks?.image || '/media/concierge/howitwork.webp'
  const howSteps = conciergeData.howItWorks?.steps?.length
    ? conciergeData.howItWorks.steps
    : [
        {
          stepNumber: '01',
          title: 'We Reach Out',
          description:
            'After purchasing your luxury home to access our exclusive concierge service, reserved only for our valued buyers.',
          icon: '/media/concierge/step1.svg',
        },
        {
          stepNumber: '02',
          title: "Let's Personalize It",
          description:
            'Tell us what matters most—your lifestyle, must-haves, and ideal timelines. We’ll collaborate to craft a customized service plan that works for you.',
          icon: '/media/concierge/step2.svg',
        },
        {
          stepNumber: '03',
          title: 'Guided Connections',
          description:
            'You’ll be introduced to our trusted network of hand-selected experts, with your concierge team guiding each step and handling the details on your behalf.',
          icon: '/media/concierge/step3.svg',
        },
        {
          stepNumber: '04',
          title: 'Enjoy the ease',
          description:
            'From move-in coordination to those last finishing touches, we make luxury living feel effortless. Welcome home.',
          icon: '/media/concierge/step4.svg',
        },
      ]

  // Why Love It Fallbacks
  const whyHeading = conciergeData.whyLoveIt?.heading || 'Why Homeowners Love It'
  const whyCards = conciergeData.whyLoveIt?.cards?.length
    ? conciergeData.whyLoveIt.cards
    : [
        {
          tag: 'EASY',
          description:
            'We simplify your transition into your new luxury home by taking care of every detail. From connecting you with trusted professionals to guiding you through essential post-purchase needs, we ensure a stress-free process',
        },
        {
          tag: 'FAST',
          description:
            'Our experienced team and reliable network deliver prompt, dependable support to keep your journey smooth and on track. We prioritize speed without compromising quality, so you can focus on enjoying your new home.',
        },
        {
          tag: 'EFFICIENT',
          description:
            'Every service we provide is designed with precision and care to save you time and effort. From start to finish, we make sure your experience is seamless, leaving no detail overlooked.',
        },
      ]

  // Contact Form Fallbacks
  const contactHeading = conciergeData.contactForm?.heading || "Let's Make Your Move Effortless"
  const contactSubheading =
    conciergeData.contactForm?.subheading ||
    'Move into your dream home without the stress of endless decisions or countless hours searching for the right services.'

  const renderAccentTitle = (titleText: string) => {
    if (titleText.includes('Concierge')) {
      const parts = titleText.split('Concierge')
      return (
        <>
          {parts[0]}
          <span style={{ color: '#8A561F' }}>Concierge</span>
          {parts[1]}
        </>
      )
    }
    return titleText
  }

  return (
    <div
      style={{
        backgroundColor: '#fcfcfc',
        backgroundImage:
          'url("https://novelsignaturehomes.com/wp-content/uploads/2024/09/topography.svg")',
        backgroundSize: 'cover',
        backgroundPosition: 'center',
        backgroundAttachment: 'fixed',
        color: '#1a1a1a',
        minHeight: '100vh',
        fontFamily: "'Montserrat', sans-serif",
      }}
    >
      {/* Import Google Fonts */}
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
      <link
        href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Montserrat:wght@300;400;500;600;700&display=swap"
        rel="stylesheet"
      />

      <style
        dangerouslySetInnerHTML={{
          __html: `
        .service-icon-card {
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .service-icon-card:hover {
          transform: translateY(-4px);
          box-shadow: 0 8px 24px rgba(0,0,0,0.08);
        }
        .concierge-hero-padding {
          padding: clamp(6.5rem, 10vh, 8.5rem) 1.5rem 4rem;
        }
        .concierge-hero-title {
          font-family: 'Cormorant Garamond', serif;
          font-size: clamp(32px, 5vw, 54px);
          font-weight: 400;
          line-height: 1.15;
          margin-bottom: 1.5rem;
        }
        .concierge-banner-img {
          width: 100%;
          height: auto;
          max-height: 480px;
          object-fit: cover;
          border-radius: 4px;
          margin-bottom: 2.5rem;
          box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        .services-grid {
          display: grid;
          grid-template-columns: repeat(2, 1fr);
          gap: 2rem 1rem;
          max-width: 1000px;
          margin: 0 auto;
        }
        .service-icon-item {
          display: flex;
          flex-direction: column;
          align-items: center;
          text-align: center;
          gap: 0.75rem;
          padding: 0.5rem 0.25rem;
          max-width: 140px;
          margin: 0 auto;
          width: 100%;
        }
        .service-icon-img-wrap {
          width: 44px;
          height: 44px;
          display: flex;
          align-items: center;
          justify-content: center;
        }
        .service-icon-img {
          width: 38px;
          height: 38px;
          object-fit: contain;
          filter: brightness(0) invert(1);
        }
        .service-icon-title {
          font-family: 'Montserrat', sans-serif;
          font-size: 11px;
          font-weight: 400;
          color: #d4d4d8;
          margin: 0;
          line-height: 1.35;
          letter-spacing: 0.3px;
          text-align: center;
        }
        @media (min-width: 640px) {
          .services-grid {
            grid-template-columns: repeat(3, 1fr);
            gap: 2.5rem 1.5rem;
          }
          .service-icon-item {
            gap: 1rem;
            max-width: 180px;
          }
          .service-icon-img-wrap {
            width: 60px;
            height: 60px;
          }
          .service-icon-img {
            width: 52px;
            height: 52px;
          }
          .service-icon-title {
            font-size: 13px;
            line-height: 1.45;
          }
        }
        @media (min-width: 1024px) {
          .services-grid {
            grid-template-columns: repeat(5, 1fr);
            gap: 3rem 2rem;
          }
        }
        .how-it-works-flex {
          display: flex;
          flex-direction: column;
          gap: 3rem;
        }
        @media (min-width: 900px) {
          .how-it-works-flex {
            flex-direction: row;
            align-items: center;
            gap: 4rem;
          }
          .how-it-works-left {
            flex: 1;
          }
          .how-it-works-right {
            flex: 1;
          }
        }
        .concierge-homeowners-grid {
          display: grid;
          grid-template-columns: 1fr;
          gap: 3rem;
        }
        @media (min-width: 768px) {
          .concierge-homeowners-grid {
            grid-template-columns: repeat(3, 1fr);
            gap: 0;
          }
          .concierge-homeowners-col {
            padding: 0 2.5rem;
            border-right: 1px solid #e8e1d6;
          }
          .concierge-homeowners-col:last-child {
            border-right: none;
          }
        }
        .concierge-contact-flex {
          display: flex;
          flex-direction: column;
          gap: 3rem;
        }
        @media (min-width: 900px) {
          .concierge-contact-flex {
            flex-direction: row;
            align-items: flex-start;
            gap: 4rem;
          }
          .concierge-contact-left {
            flex: 1;
          }
          .concierge-contact-right {
            flex: 1.2;
          }
        }
        .concierge-form-input {
          width: 100%;
          padding: 12px 14px;
          border: none;
          background-color: #efefef;
          font-family: 'Montserrat', sans-serif;
          font-size: 14px;
          color: #1a1a1a;
          outline: none;
          transition: background-color 0.2s ease;
        }
        .concierge-form-input:focus {
          background-color: #e5e5e5;
        }
      `,
        }}
      />

      {/* 1. Hero Banner Section */}
      <section className="max-width concierge-hero-padding">
        <h1 className="concierge-hero-title">{renderAccentTitle(heroTitle)}</h1>
        <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '0 0 2rem' }} />

        {/* Hero Description Paragraph (Above Banner Image) */}
        <p
          style={{
            fontFamily: "'Montserrat', sans-serif",
            fontSize: '15px',
            color: '#262626',
            lineHeight: '1.85',
            margin: '0 0 2.5rem',
            maxWidth: '1320px',
            fontWeight: '400',
          }}
        >
          {heroDesc}
        </p>

        {/* Hero Banner Image (Below Description Paragraph) */}
        {heroBanner && <img src={heroBanner} alt={heroTitle} className="concierge-banner-img" />}
      </section>

      {/* 2. Our Services Section */}
      <section
        className="max-width concierge-our-services"
        style={{
          backgroundColor: '#18181b',
          backgroundImage:
            'url("https://novelsignaturehomes.com/wp-content/uploads/2024/09/topography.svg")',
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          color: '#ffffff',
          padding: '5rem 1.5rem',
        }}
      >
        <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
          <h2
            style={{
              fontFamily: "'Cormorant Garamond', serif",
              fontSize: '40px',
              fontWeight: '400',
              color: '#ffffff',
              margin: '0 0 0.75rem',
              letterSpacing: '0.5px',
            }}
          >
            {servicesHeading}
          </h2>
          <hr
            style={{
              border: 'none',
              borderTop: '1px solid #3f3f46',
              margin: '0 0 3.5rem',
              maxWidth: '220px',
            }}
          />

          <div className="services-grid">
            {servicesList.map((item: any, idx: number) => (
              <div key={idx} className="service-icon-item">
                <div className="service-icon-img-wrap">
                  <img
                    src={item.icon || '/media/concierge/loan.webp'}
                    alt={item.title}
                    className="service-icon-img"
                  />
                </div>
                <h3 className="service-icon-title">{item.title}</h3>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* 3. How It Works Section */}
      <section
        className="max-width concierge-works"
        style={{
          backgroundColor: '#fcfcfc',
          backgroundImage:
            'url("https://novelsignaturehomes.com/wp-content/uploads/2024/09/topography.svg")',
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          backgroundAttachment: 'fixed',
          borderTop: '1px solid #e8e1d6',
          borderBottom: '1px solid #e8e1d6',
          padding: '5rem 1.5rem',
        }}
      >
        <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
          <h2
            style={{
              fontFamily: "'Cormorant Garamond', serif",
              fontSize: '44px',
              fontWeight: '400',
              color: '#1a1a1a',
              margin: '0 0 1rem',
              letterSpacing: '0.5px',
            }}
          >
            How <span style={{ color: '#8A561F' }}>It Works</span>
          </h2>
          <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '0 0 3.5rem' }} />

          <div className="how-it-works-flex">
            {/* Steps Left List */}
            <div
              className="how-it-works-left"
              style={{ display: 'flex', flexDirection: 'column', gap: '2.5rem' }}
            >
              {howSteps.map((step: any, idx: number) => {
                const stepSvg = step.icon || `/media/concierge/step${idx + 1}.svg`

                return (
                  <div
                    key={idx}
                    style={{ display: 'flex', gap: '1.75rem', alignItems: 'flex-start' }}
                  >
                    {/* SVG Step Number */}
                    <div
                      style={{
                        minWidth: '36px',
                        height: '56px',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        flexShrink: 0,
                        marginTop: '2px',
                      }}
                    >
                      <img
                        src={stepSvg}
                        alt={step.stepNumber || `Step ${idx + 1}`}
                        style={{
                          height: '52px',
                          width: 'auto',
                          objectFit: 'contain',
                        }}
                      />
                    </div>

                    {/* Step Title & Description */}
                    <div>
                      <h3
                        style={{
                          fontFamily: "'Montserrat', sans-serif",
                          fontSize: '18px',
                          fontWeight: '600',
                          color: '#1a1a1a',
                          margin: '0 0 0.4rem',
                          lineHeight: '1.3',
                        }}
                      >
                        {step.title}
                      </h3>
                      <p
                        style={{
                          fontFamily: "'Montserrat', sans-serif",
                          fontSize: '13px',
                          color: '#525252',
                          lineHeight: '1.75',
                          margin: 0,
                          maxWidth: '540px',
                          fontWeight: '400',
                        }}
                      >
                        {step.description}
                      </p>
                    </div>
                  </div>
                )
              })}
            </div>

            {/* Image Right */}
            <div className="how-it-works-right">
              <img
                src={howImage}
                alt="How it works"
                style={{
                  width: '100%',
                  height: 'auto',
                  borderRadius: '2px',
                  boxShadow: '0 6px 24px rgba(0,0,0,0.06)',
                  display: 'block',
                }}
              />
            </div>
          </div>
        </div>
      </section>

      {/* 4. Why Homeowners Love It Section */}
      <section className="max-width concierge-homeowners" style={{ padding: '5rem 1.5rem' }}>
        <div style={{ textAlign: 'center', marginBottom: '3.5rem' }}>
          <h2
            style={{
              fontFamily: "'Cormorant Garamond', serif",
              fontSize: '44px',
              fontWeight: '400',
              color: '#1a1a1a',
              margin: '0 0 1rem',
              letterSpacing: '0.5px',
              textAlign: 'center',
            }}
          >
            Why Homeowners <span style={{ color: '#8A561F' }}>Love It</span>
          </h2>
          <hr
            style={{
              border: 'none',
              borderTop: '1px solid #e8e1d6',
              margin: '0 auto',
              maxWidth: '320px',
            }}
          />
        </div>

        <div className="concierge-homeowners-grid">
          {whyCards.map((card: any, idx: number) => (
            <div
              key={idx}
              className="concierge-homeowners-col"
              style={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                textAlign: 'center',
                gap: '1.25rem',
              }}
            >
              <h3
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '22px',
                  fontWeight: '500',
                  color: '#1a1a1a',
                  letterSpacing: '3px',
                  textTransform: 'uppercase',
                  margin: 0,
                }}
              >
                {card.tag}
              </h3>
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '13px',
                  color: '#525252',
                  lineHeight: '1.8',
                  margin: 0,
                  maxWidth: '380px',
                  fontWeight: '400',
                }}
              >
                {card.description}
              </p>
            </div>
          ))}
        </div>
      </section>

      {/* 5. Contact Form Section */}
      <section
        className="max-width concierge-homeowners concierge-homeowners-contact"
        style={{
          backgroundColor: '#fcfcfc',
          backgroundImage:
            'url("https://novelsignaturehomes.com/wp-content/uploads/2024/09/topography.svg")',
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          backgroundAttachment: 'fixed',
          borderTop: '1px solid #e8e1d6',
          padding: '5rem 1.5rem',
        }}
      >
        <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
          <div className="concierge-contact-flex">
            {/* Left Column: Heading & Subtitle */}
            <div className="concierge-contact-left">
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '44px',
                  fontWeight: '400',
                  color: '#1a1a1a',
                  margin: '0 0 1rem',
                  letterSpacing: '0.5px',
                  lineHeight: '1.2',
                }}
              >
                Let’s Make Your Move <span style={{ color: '#8A561F' }}>Effortless</span>
              </h2>
              <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '0 0 2rem' }} />

              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '14px',
                  color: '#525252',
                  lineHeight: '1.8',
                  margin: 0,
                  maxWidth: '520px',
                  fontWeight: '400',
                }}
              >
                {contactSubheading}
              </p>
            </div>

            {/* Right Column: Form */}
            <div className="concierge-contact-right">
              <form style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
                <div>
                  <label
                    style={{
                      display: 'block',
                      fontSize: '13px',
                      color: '#333333',
                      marginBottom: '6px',
                      fontWeight: '500',
                    }}
                  >
                    Name *
                  </label>
                  <input type="text" required className="concierge-form-input" />
                </div>

                <div>
                  <label
                    style={{
                      display: 'block',
                      fontSize: '13px',
                      color: '#333333',
                      marginBottom: '6px',
                      fontWeight: '500',
                    }}
                  >
                    Phone
                  </label>
                  <input type="tel" className="concierge-form-input" />
                </div>

                <div>
                  <label
                    style={{
                      display: 'block',
                      fontSize: '13px',
                      color: '#333333',
                      marginBottom: '6px',
                      fontWeight: '500',
                    }}
                  >
                    Email *
                  </label>
                  <input type="email" required className="concierge-form-input" />
                </div>

                <div>
                  <label
                    style={{
                      display: 'block',
                      fontSize: '13px',
                      color: '#333333',
                      marginBottom: '6px',
                      fontWeight: '500',
                    }}
                  >
                    Message
                  </label>
                  <textarea
                    rows={5}
                    className="concierge-form-input"
                    style={{ resize: 'vertical' }}
                  ></textarea>
                </div>

                <div style={{ marginTop: '0.5rem' }}>
                  <button
                    type="submit"
                    style={{
                      backgroundColor: '#000000',
                      color: '#ffffff',
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      fontWeight: '600',
                      padding: '12px 28px',
                      border: 'none',
                      cursor: 'pointer',
                      borderRadius: '1px',
                    }}
                  >
                    Submit
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}

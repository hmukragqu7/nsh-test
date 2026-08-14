import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'

export const metadata = {
  title: 'Luxury Properties | Novel Signature Homes',
  description: 'Explore our portfolio of luxury single-family custom residences.',
}

export default async function PropertiesIndexPage() {
  let result: any = { docs: [] }
  let pagesResult: any = { docs: [] }

  try {
    const payload = await getPayload({ config: configPromise })
    result = await payload.find({
      collection: 'properties',
      depth: 2,
      limit: 100,
    })

    // Fetch properties page content from Pages collection
    pagesResult = await payload.find({
      collection: 'pages',
      where: {
        slug: {
          equals: 'properties',
        },
      },
      limit: 1,
    })
  } catch (err) {
    // Fallback on cold DB build
  }
  const pageDoc = pagesResult.docs?.[0] as any
  const headerData = pageDoc?.propertiesPageHeader || {}
  const headerTitle = headerData.title || 'Luxury Homes For Sale In Texas'
  const headerDesc =
    headerData.description ||
    "Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection."
  const sectionHeading = headerData.sectionHeading || 'Our Properties'

  const renderMainTitle = (text: string) => {
    if (text.includes('Luxury Homes')) {
      const parts = text.split('Luxury Homes')
      return (
        <>
          {parts[0]}
          <span style={{ color: '#8A561F' }}>Luxury Homes</span>
          {parts[1]}
        </>
      )
    }
    return text
  }

  const renderSectionHeading = (text: string) => {
    if (text.includes('Properties')) {
      const parts = text.split('Properties')
      return (
        <>
          {parts[0]}
          <span style={{ color: '#8A561F' }}>Properties</span>
          {parts[1]}
        </>
      )
    }
    return text
  }

  // Filter out children properties so only individual homes and parent community landing pages are listed in the main index
  const properties = (result.docs as any[]).filter((prop) => !prop.parentProperty)

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

      {/* Topography layout styles & Responsive CSS */}
      <style
        dangerouslySetInnerHTML={{
          __html: `
        .property-card-container {
          transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .property-card-container:hover {
          transform: translateY(-4px);
        }
        .properties-grid {
          display: grid;
          grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
          gap: 2.5rem 2rem;
        }
        @media (min-width: 768px) {
          .properties-grid {
            grid-template-columns: repeat(auto-fill, minmax(480px, 1fr));
            gap: 4rem 2.5rem;
          }
        }
        .property-image-wrapper {
          position: relative;
          width: 100%;
          height: 240px;
          overflow: hidden;
          background-color: #e2e8f0;
        }
        @media (min-width: 640px) {
          .property-image-wrapper {
            height: 360px;
          }
        }
        .properties-header-section {
          max-width: 1440px;
          margin: 0 auto;
          padding: clamp(6rem, 10vh, 8.5rem) 1.5rem 0;
        }
        .properties-main-title {
          font-family: 'Cormorant Garamond', serif;
          font-size: clamp(28px, 5vw, 48px);
          font-weight: 400;
          color: #1a1a1a;
          margin: 0 0 1.25rem;
          letter-spacing: 0.5px;
          line-height: 1.2;
        }
        .properties-main-desc {
          font-family: 'Montserrat', sans-serif;
          font-size: clamp(13px, 2vw, 15px);
          color: #000000ff;
          line-height: 1.85;
          margin: 0 0 2.5rem;
          // max-width: 1100px;
          font-weight: 400;
        }
        @media (min-width: 640px) {
          .properties-main-desc {
            margin-bottom: 3.5rem;
          }
        }
        .properties-sub-heading {
          font-family: 'Cormorant Garamond', serif;
          font-size: clamp(24px, 4vw, 32px);
          font-weight: 400;
          color: #1a1a1a;
          margin: 0 0 1rem;
          letter-spacing: 0.5px;
        }
        .properties-cards-section {
          max-width: 1440px;
          margin: 0 auto;
          padding: 0 1rem 4rem;
        }
        @media (min-width: 640px) {
          .properties-cards-section {
            padding: 0 1.5rem 6rem;
          }
        }
        .property-card-details-row {
          display: flex;
          flex-direction: column;
          align-items: flex-start;
          padding-top: 1rem;
          gap: 0.75rem;
        }
        @media (min-width: 500px) {
          .property-card-details-row {
            flex-direction: row;
            justify-content: space-between;
            align-items: flex-start;
            padding-top: 1.25rem;
            gap: 1.5rem;
          }
        }
        .property-card-right-col {
          text-align: left;
          flex-shrink: 0;
        }
        @media (min-width: 500px) {
          .property-card-right-col {
            text-align: right;
          }
        }
      `,
        }}
      />

      {/* Hero Header Section */}
      <section className="max-width properties-header-section">
        <h1 className="properties-main-title">{renderMainTitle(headerTitle)}</h1>
        <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '0 0 2rem' }} />

        <p className="properties-main-desc">{headerDesc}</p>

        <h2 className="properties-sub-heading">{renderSectionHeading(sectionHeading)}</h2>
        <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '0 0 3rem' }} />
      </section>

      {/* Property Cards Grid */}
      <section className="max-width properties-cards-section">
        <div className="properties-grid">
          {properties.map((prop) => {
            const imageUrl =
              prop.bannerImages && prop.bannerImages.length > 0 && prop.bannerImages[0]?.url
                ? prop.bannerImages[0].url
                : 'https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp'

            // Dynamic status color & label
            const isSold = prop.status === 'sold'
            const isUnderContract = prop.status === 'under_contract'
            const statusColor = isSold ? '#ef4444' : isUnderContract ? '#eab308' : '#22c55e'
            const statusLabel = isSold
              ? 'Sold Out'
              : isUnderContract
                ? 'Under Contract'
                : 'For Sale'

            // Subtitle formatting based on address and status
            const addressParts = prop.address?.split(',') || []
            const cityState =
              addressParts.slice(-2).join(',').trim() || prop.address || 'Houston, Texas'
            const subtitleText = isSold
              ? `Home sold in ${cityState}`
              : isUnderContract
                ? `Home under contract in ${cityState}`
                : `Homes for sale in ${cityState}`

            // Specs string formatting
            const specsParts = []
            if (prop.propertySummary?.numberOfBeds)
              specsParts.push(`${prop.propertySummary.numberOfBeds} BD`)
            if (prop.propertySummary?.numberOfBaths)
              specsParts.push(`${prop.propertySummary.numberOfBaths} BA`)
            if (prop.propertySummary?.acArea)
              specsParts.push(`AC Area : ${prop.propertySummary.acArea}`)
            const specsText = specsParts.join(' | ')

            return (
              <Link
                key={prop.id}
                href={`/properties/${prop.slug}`}
                style={{ textDecoration: 'none', color: 'inherit' }}
                className="property-card-container"
              >
                <div style={{ display: 'flex', flexDirection: 'column' }}>
                  {/* Image wrapper with absolute badges */}
                  <div className="property-image-wrapper">
                    <img
                      src={imageUrl}
                      alt={prop.name}
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover',
                        display: 'block',
                      }}
                    />

                    {/* Featured Badge (Top Left) */}
                    {prop.featured && (
                      <div
                        style={{
                          position: 'absolute',
                          top: '15px',
                          left: '15px',
                          backgroundColor: '#111827',
                          color: '#ffffff',
                          fontSize: '9px',
                          fontWeight: '700',
                          padding: '4px 10px',
                          textTransform: 'uppercase',
                          letterSpacing: '1px',
                          borderRadius: '2px',
                          boxShadow: '0 2px 8px rgba(0,0,0,0.25)',
                        }}
                      >
                        Featured
                      </div>
                    )}

                    {/* Status Badge (Top Right) */}
                    <div
                      style={{
                        position: 'absolute',
                        top: '15px',
                        right: '15px',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        backgroundColor: 'rgba(17, 24, 39, 0.8)',
                        backdropFilter: 'blur(4px)',
                        color: '#ffffff',
                        fontSize: '9px',
                        fontWeight: '700',
                        padding: '4px 10px',
                        textTransform: 'uppercase',
                        letterSpacing: '1px',
                        borderRadius: '2px',
                        boxShadow: '0 2px 8px rgba(0,0,0,0.25)',
                      }}
                    >
                      <span
                        style={{
                          display: 'inline-block',
                          width: '6px',
                          height: '6px',
                          borderRadius: '50%',
                          backgroundColor: statusColor,
                        }}
                      ></span>
                      {statusLabel}
                    </div>
                  </div>

                  {/* Card Details Block */}
                  <div className="property-card-details-row">
                    {/* Left details */}
                    <div>
                      <h2
                        style={{
                          fontSize: '16px',
                          fontWeight: '700',
                          color: '#1a1a1a',
                          margin: '0 0 0.25rem',
                          lineHeight: '1.4',
                        }}
                      >
                        {prop.name}
                      </h2>
                      <div style={{ fontSize: '13px', color: '#737373', fontWeight: '400' }}>
                        {subtitleText}
                      </div>
                    </div>

                    {/* Right details */}
                    <div className="property-card-right-col">
                      <div
                        style={{
                          fontSize: '12px',
                          color: '#737373',
                          fontWeight: '500',
                          marginBottom: '0.4rem',
                          letterSpacing: '0.5px',
                        }}
                      >
                        {specsText}
                      </div>
                      <div style={{ fontSize: '18px', fontWeight: '700', color: '#1a1a1a' }}>
                        {prop.price}
                      </div>
                    </div>
                  </div>
                </div>
              </Link>
            )
          })}
        </div>
      </section>
    </div>
  )
}

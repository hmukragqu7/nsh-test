import React from 'react'
import Link from 'next/link'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import RichText from '@/components/RichText'
import { RenderBlocks } from '@/blocks/RenderBlocks'

export const metadata = {
  title: 'Terms and Conditions - Novel Signature Homes',
  description:
    'Terms and Conditions of Use effective as of April 5, 2025. Governs access to and use of novelsignaturehomes.com.',
}

export default async function TermsAndConditionsPage() {
  const payload = await getPayload({ config: configPromise })

  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'terms-and-conditions',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const cmsData = pageDoc?.termsAndConditionsPage || {}

  const pageTitle = cmsData.title || pageDoc?.title || 'Terms and Conditions'
  const subheading = cmsData.subheading || 'Terms and condition'
  const effectiveDate = cmsData.effectiveDate || 'Effective as of April 5, 2025'
  const cmsSections = cmsData.sections || []
  const layoutBlocks = pageDoc?.layout || []

  return (
    <div style={{ backgroundColor: '#ffffff', minHeight: '100vh', color: '#1a1a1a' }}>
      <section
        style={{
          paddingTop: 'clamp(6rem, 10vh, 8.5rem)',
          paddingBottom: '4rem',
          paddingLeft: '1.5rem',
          paddingRight: '1.5rem',
          backgroundColor: '#ffffff',
        }}
      >
        <div style={{ maxWidth: '1100px', margin: '0 auto' }}>
          {/* Main H1 Heading */}
          <h1
            style={{
              fontFamily: "'Cormorant Garamond', Georgia, serif",
              fontSize: 'clamp(2.5rem, 4.5vw, 3.5rem)',
              fontWeight: 600,
              color: '#1a1a1a',
              margin: 0,
              paddingBottom: '16px',
              borderBottom: '1px solid #e5e7eb',
              lineHeight: 1.2,
            }}
          >
            {pageTitle}
          </h1>

          {/* Subheading */}
          <h2
            style={{
              fontFamily: "'Cormorant Garamond', Georgia, serif",
              fontSize: 'clamp(1.8rem, 3vw, 2.25rem)',
              fontWeight: 500,
              color: '#1a1a1a',
              marginTop: '2rem',
              marginBottom: '0.75rem',
            }}
          >
            {subheading}
          </h2>

          {/* Effective Date */}
          <p
            style={{
              fontFamily: "'Montserrat', sans-serif",
              fontSize: '1rem',
              color: '#6b7280',
              fontWeight: 500,
              marginBottom: '2.5rem',
            }}
          >
            {effectiveDate}
          </p>

          {/* POLICY CONTENT BODY FROM CMS */}
          <div
            style={{
              fontFamily: "'Montserrat', sans-serif",
              fontSize: '1rem',
              lineHeight: 1.8,
              color: '#374151',
              display: 'flex',
              flexDirection: 'column',
              gap: '2.5rem',
            }}
          >
            {cmsSections.map((sec: any, idx: number) => (
              <div key={sec.id || idx}>
                {/* Section Heading */}
                {sec.heading && (
                  <h2
                    style={{
                      fontFamily: "'Cormorant Garamond', Georgia, serif",
                      fontSize: '2.1875rem',
                      fontWeight: 500,
                      color: '#1a1a1a',
                      marginBottom: '1.25rem',
                    }}
                  >
                    {sec.heading}
                  </h2>
                )}

                {/* Section Content */}
                {sec.content && typeof sec.content === 'object' && sec.content.root ? (
                  <RichText data={sec.content} enableGutter={false} />
                ) : typeof sec.content === 'string' ? (
                  <p style={{ margin: 0, whiteSpace: 'pre-line' }}>{sec.content}</p>
                ) : null}
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* DYNAMIC CMS LAYOUT BLOCKS */}
      {layoutBlocks && layoutBlocks.length > 0 && <RenderBlocks blocks={layoutBlocks} />}
    </div>
  )
}

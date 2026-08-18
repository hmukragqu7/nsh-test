import React from 'react'
import Link from 'next/link'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import RichText from '@/components/RichText'
import { RenderBlocks } from '@/blocks/RenderBlocks'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'Privacy Policy - Novel Signature Homes',
  description:
    'Privacy Policy Effective as of April 5, 2025. Learn how Novel Signature Homes collects, uses, discloses, and protects your personal information.',
}

export default async function PrivacyPolicyPage() {
  const payload = await getPayload({ config: configPromise })

  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'privacy-policy',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const cmsData = pageDoc?.privacyPolicyPage || {}

  const pageTitle = cmsData.title || 'Privacy Policy'
  const effectiveDate = cmsData.effectiveDate || 'Effective as of April 5, 2025'
  const cmsSections = cmsData.sections || []
  const layoutBlocks = pageDoc?.layout || []

  return (
    <div style={{ backgroundColor: '#ffffff', minHeight: '100vh', color: '#1a1a1a' }}>
      {/* HEADER / HERO SECTION */}
      <section
        style={{
          paddingTop: 'clamp(6rem, 10vh, 8.5rem)',
          paddingBottom: '2.5rem',
          paddingLeft: '1.5rem',
          paddingRight: '1.5rem',
          backgroundColor: '#ffffff',
        }}
      >
        <div style={{ maxWidth: '1100px', margin: '0 auto' }}>
          {/* Main H1 Title */}
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

          {/* Subheading: Privacy Policy H2 */}
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
            {pageTitle}
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

          {/* POLICY CONTENT BODY */}
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
                      fontSize: '1.75rem',
                      fontWeight: 600,
                      color: '#1a1a1a',
                      marginBottom: '1rem',
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

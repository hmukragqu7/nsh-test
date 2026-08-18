import React from 'react'
import Link from 'next/link'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import RichText from '@/components/RichText'
import { RenderBlocks } from '@/blocks/RenderBlocks'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'Thank You - Novel Signature Homes',
  description: 'Thank You for reaching out to Novel Signature Homes.',
}

export default async function ThankYouPage() {
  const payload = await getPayload({ config: configPromise })

  const pagesResult = await payload.find({
    collection: 'pages',
    where: {
      slug: {
        equals: 'thank-you',
      },
    },
    limit: 1,
  })

  const pageDoc = pagesResult.docs?.[0] as any
  const cmsData = pageDoc?.thankYouPage || {}

  const title = cmsData.title || 'Thank You'
  const subheading = cmsData.subheading || 'Thank You for Reaching Out'
  const message = cmsData.message || 'We have received your message and will get back to you shortly.'
  const buttonText = cmsData.buttonText || 'Back to Home'
  const buttonLink = cmsData.buttonLink || '/'

  return (
    <div
      style={{
        backgroundColor: '#ffffff',
        minHeight: '80vh',
        padding: '6rem 1.5rem',
        color: '#1a1a1a',
      }}
    >
      <div style={{ maxWidth: '600px', width: '100%', margin: '0 auto', textAlign: 'center' }}>
        <h1
          style={{
            fontFamily: "'Cormorant Garamond', Georgia, serif",
            fontSize: 'clamp(2.5rem, 5vw, 3.5rem)',
            fontWeight: 600,
            color: '#1a1a1a',
            margin: 0,
            marginBottom: '1rem',
          }}
        >
          {title}
        </h1>

        <h2
          style={{
            fontFamily: "'Montserrat', sans-serif",
            fontSize: '1.25rem',
            fontWeight: 500,
            color: '#9e6b27',
            marginBottom: '1.5rem',
          }}
        >
          {subheading}
        </h2>

        <p
          style={{
            fontFamily: "'Montserrat', sans-serif",
            fontSize: '1rem',
            lineHeight: 1.7,
            color: '#4a4a4a',
            marginBottom: '2.5rem',
          }}
        >
          {message}
        </p>

        {cmsData?.additionalContent && (
          <div style={{ marginBottom: '2.5rem', textAlign: 'left' }}>
            <RichText data={cmsData.additionalContent} />
          </div>
        )}

        <Link
          href={buttonLink}
          style={{
            display: 'inline-block',
            backgroundColor: '#000000',
            color: '#ffffff',
            padding: '14px 40px',
            fontSize: '0.9rem',
            fontWeight: 600,
            fontFamily: "'Montserrat', sans-serif",
            textDecoration: 'none',
            letterSpacing: '0.5px',
            transition: 'background-color 0.2s ease',
          }}
        >
          {buttonText}
        </Link>
      </div>

      {pageDoc?.layout && pageDoc.layout.length > 0 && (
        <div style={{ marginTop: '4rem' }}>
          <RenderBlocks blocks={pageDoc.layout} />
        </div>
      )}
    </div>
  )
}

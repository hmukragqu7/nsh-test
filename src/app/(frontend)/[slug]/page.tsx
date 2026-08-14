import type { Metadata } from 'next'

import { PayloadRedirects } from '@/components/PayloadRedirects'
import configPromise from '@payload-config'
import { getPayload, type RequiredDataFromCollectionSlug } from 'payload'
import { draftMode } from 'next/headers'
import React, { cache } from 'react'
import { homeStatic } from '@/endpoints/seed/home-static'

import { RenderBlocks } from '@/blocks/RenderBlocks'
import { RenderHero } from '@/heros/RenderHero'
import { generateMeta } from '@/utilities/generateMeta'
import PageClient from './page.client'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import NSHHomePage from '@/components/NSHHomePage'

export async function generateStaticParams() {
  try {
    const payload = await getPayload({ config: configPromise })
    const pages = await payload.find({
      collection: 'pages',
      draft: false,
      limit: 1000,
      overrideAccess: false,
      pagination: false,
      select: {
        slug: true,
      },
    })

    const params = pages.docs
      ?.filter((doc) => {
        return doc.slug !== 'home'
      })
      .map(({ slug }) => {
        return { slug }
      })

    return params
  } catch (err) {
    return []
  }
}

type Args = {
  params: Promise<{
    slug?: string
  }>
}

export default async function Page({ params: paramsPromise }: Args) {
  const { isEnabled: draft } = await draftMode()
  const { slug = 'home' } = await paramsPromise
  // Decode to support slugs with special characters
  const decodedSlug = decodeURIComponent(slug)
  const url = '/' + decodedSlug
  let page: RequiredDataFromCollectionSlug<'pages'> | null

  page = await queryPageBySlug({
    slug: decodedSlug,
  })

  // Remove this code once your website is seeded
  if (!page && slug === 'home') {
    page = homeStatic
  }

  if (!page) {
    return <PayloadRedirects url={url} />
  }

  const hero = (page as any)?.hero || {}
  const layout = (page as any)?.layout || []

  if (decodedSlug === 'home') {
    let individualProperties: any[] = []
    try {
      const payload = await getPayload({ config: configPromise })
      const propertiesResult = await payload.find({
        collection: 'properties',
        depth: 2,
        limit: 100,
        overrideAccess: true,
      })

      individualProperties = propertiesResult.docs
        .filter((prop: any) => prop.featured && !prop.isGroupParent)
        .map((prop: any) => {
          const beds = prop.propertySummary?.numberOfBeds ? `${prop.propertySummary.numberOfBeds} BD` : ''
          const baths = prop.propertySummary?.numberOfBaths ? `${prop.propertySummary.numberOfBaths} BA` : ''
          const ac = prop.propertySummary?.acArea ? `AC Area: ${prop.propertySummary.acArea}` : ''
          const detailsStr = [beds, baths, ac].filter(Boolean).join(' | ')

          const statusLabels: Record<string, string> = {
            for_sale: 'for sale',
            sold: 'sold',
            under_contract: 'under contract',
          }
          const mappedStatus = statusLabels[prop.status] || 'for sale'

          return {
            image: prop.bannerImages?.[0]?.url || '/media/034.webp',
            status: mappedStatus,
            title: prop.name,
            details: detailsStr || 'Contact for details',
            href: `/properties/${prop.slug}`,
          }
        })
    } catch (err) {
      // Graceful fallback during static build when DB is empty
    }

    return (
      <article>
        <PageClient />
        {draft && <LivePreviewListener />}
        <NSHHomePage pageData={page} initialListings={individualProperties} />
      </article>
    )
  }

  return (
    <article className="pt-16 pb-24">
      <PageClient />
      {/* Allows redirects for valid pages too */}
      <PayloadRedirects disableNotFound url={url} />

      {draft && <LivePreviewListener />}

      <RenderHero {...hero} />
      <RenderBlocks blocks={layout} />
    </article>
  )
}

export async function generateMetadata({ params: paramsPromise }: Args): Promise<Metadata> {
  const { slug = 'home' } = await paramsPromise
  // Decode to support slugs with special characters
  const decodedSlug = decodeURIComponent(slug)
  const page = await queryPageBySlug({
    slug: decodedSlug,
  })

  return generateMeta({ doc: page })
}

const queryPageBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()

  try {
    const payload = await getPayload({ config: configPromise })

    const result = await payload.find({
      collection: 'pages',
      draft,
      limit: 1,
      pagination: false,
      overrideAccess: draft,
      where: {
        slug: {
          equals: slug,
        },
      },
    })

    return result.docs?.[0] || null
  } catch (err) {
    return null
  }
})

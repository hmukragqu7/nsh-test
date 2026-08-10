import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import { notFound } from 'next/navigation'
import PropertyDetailClient from './PropertyDetailClient'

interface PropertyPageProps {
  params: Promise<{
    slug: string
  }>
}

export async function generateMetadata({ params }: PropertyPageProps) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  const result = await payload.find({
    collection: 'properties',
    where: {
      slug: {
        equals: slug,
      },
    },
  })

  const property = result.docs[0]
  if (!property) return { title: 'Property Not Found' }

  return {
    title: `${property.name} | Luxury Homes Sale in Texas`,
    description: `${property.name} is currently for sale. ${property.propertySummary?.acArea || '5,897'} Square Feet single family residential is a ${property.propertySummary?.numberOfBeds || '5'} beds, ${property.propertySummary?.numberOfBaths || '7'} baths luxury property on novelsignaturehomes.com`,
  }
}

export default async function PropertyDetailPage({ params }: PropertyPageProps) {
  const { slug } = await params
  const payload = await getPayload({ config: configPromise })
  
  // 1. Fetch main property
  const result = await payload.find({
    collection: 'properties',
    where: {
      slug: {
        equals: slug,
      },
    },
    depth: 2,
  })

  const property = result.docs[0] as any
  if (!property) {
    notFound()
  }

  // 2. Fetch other properties for Swiper carousel
  const otherResult = await payload.find({
    collection: 'properties',
    where: {
      slug: {
        not_equals: slug,
      },
    },
    limit: 10,
    depth: 2,
  })

  // Extract Youtube ID helper
  const getYoutubeEmbedUrl = (url?: string) => {
    if (!url) return null
    const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
    const match = url.match(regExp)
    return match && match[2].length === 11
      ? `https://www.youtube.com/embed/${match[2]}`
      : url
  }

  const youtubeEmbedUrl = getYoutubeEmbedUrl(property.video?.youtubeUrl)

  // 3. If parent community, fetch all units/child properties
  let childProperties: any[] = []
  if (property.isGroupParent) {
    const childResult = await payload.find({
      collection: 'properties',
      where: {
        parentProperty: {
          equals: property.id,
        },
      },
      limit: 100,
      depth: 2,
    })
    childProperties = childResult.docs
  }

  return (
    <PropertyDetailClient
      property={property}
      otherProperties={otherResult.docs}
      youtubeEmbedUrl={youtubeEmbedUrl}
      childProperties={childProperties}
    />
  )
}

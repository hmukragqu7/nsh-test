import React, { cache } from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'
import { draftMode } from 'next/headers'
import RichText from '@/components/RichText'
import { LivePreviewListener } from '@/components/LivePreviewListener'
import { PayloadRedirects } from '@/components/PayloadRedirects'
import { formatAuthors } from '@/utilities/formatAuthors'
import BlogInteractiveSection from './BlogInteractiveSection'

interface BlogPageProps {
  params: Promise<{
    slug: string
  }>
}

function formatDate(dateString?: string) {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date.toLocaleDateString('en-US', {
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })
}

function formatDateNumeric(dateString?: string) {
  if (!dateString) return ''
  const d = new Date(dateString)
  const day = String(d.getDate()).padStart(2, '0')
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const year = d.getFullYear()
  return `${month}/${day}/${year}`
}

export async function generateMetadata({ params }: BlogPageProps) {
  const { slug } = await params
  const decodedSlug = decodeURIComponent(slug)
  const blog = await queryBlogBySlug({ slug: decodedSlug })
  if (!blog) return { title: 'Article Not Found' }

  return {
    title: `${blog.title} - Novel Signature Homes`,
    description: blog.excerpt || `Read our latest article: ${blog.title}`,
  }
}

export default async function BlogDetailPage({ params }: BlogPageProps) {
  const { slug } = await params
  const decodedSlug = decodeURIComponent(slug)
  const url = '/blogs/' + decodedSlug
  const blogData = await queryBlogAndRelatedBySlug({ slug: decodedSlug })

  if (!blogData || !blogData.blog) {
    return <PayloadRedirects url={url} />
  }

  const { blog, exploreMoreBlogs } = blogData
  const { isEnabled: draft } = await draftMode()

  // Format author display name
  const authorName =
    blog.populatedAuthors && blog.populatedAuthors.length > 0
      ? formatAuthors(blog.populatedAuthors)
      : 'AJ'

  const formattedDate = blog.publishedAt ? formatDate(blog.publishedAt) : 'May 5, 2026'
  const readTimeStr = `${blog.readingTime || 1} min read`

  return (
    <div className="bg-white text-[#1a1a1a] min-h-screen">
      {/* Dynamic preview / redirects */}
      <PayloadRedirects disableNotFound url={url} />
      {draft && <LivePreviewListener />}

      {/* Main Narrow Container */}
      <main className="nsh-container-narrow">
        {/* Breadcrumbs */}
        <nav aria-label="Breadcrumb" className="mb-6 text-[0.88rem] text-[#64748b]">
          <ol className="flex items-center gap-2 flex-wrap p-0 m-0 list-none">
            <li>
              <Link href="/" className="text-inherit hover:text-[#8a561f] no-underline">
                Home
              </Link>
            </li>
            <li>/</li>
            <li>
              <Link href="/blogs" className="text-inherit hover:text-[#8a561f] no-underline">
                Blogs
              </Link>
            </li>
            <li>/</li>
            <li className="text-[#1a1a1a] font-medium line-clamp-1 max-w-[320px]">{blog.title}</li>
          </ol>
        </nav>

        {/* Title */}
        <h1 className="nsh-title-h1 mb-5">{blog.title}</h1>

        {/* Article Meta: Author / Date of published / Time to read */}
        <div className="flex items-center gap-2 text-[0.88rem] text-[#64748b] mb-8 font-medium">
          <span>By {authorName}</span>
          <span>/</span>
          <span>{formattedDate}</span>
          <span>/</span>
          <span>{readTimeStr}</span>
        </div>

        {/* Excerpt Summary */}
        {blog.excerpt && (
          <p className="text-[1.1rem] text-[#334155] italic border-l-3 border-[#8A561F] pl-5 mb-8 leading-relaxed">
            {blog.excerpt}
          </p>
        )}

        {/* Banner Hero Image */}
        {blog.heroImage && typeof blog.heroImage === 'object' && blog.heroImage.url && (
          <div className="rounded-md overflow-hidden mb-10 shadow-sm">
            <img
              src={blog.heroImage.url}
              alt={blog.title}
              className="w-full h-auto max-h-[540px] object-cover block"
            />
          </div>
        )}

        {/* RichText Content Editor Body */}
        <article className="prose prose-lg max-w-none text-[#334155] leading-relaxed">
          <RichText data={blog.content} enableGutter={false} />
        </article>

        {/* Social Share & Comments Section */}
        <BlogInteractiveSection title={blog.title} />
      </main>

      {/* Explore More Section */}
      {exploreMoreBlogs && exploreMoreBlogs.length > 0 && (
        <section className="bg-white pt-12 pb-24">
          <div className="max-width px-6">
            <h2 className="nsh-title-h2 mb-2">Explore More</h2>
            <hr className="border-t border-[#d1d5db] mb-8" />

            <div className="nsh-explore-grid">
              {exploreMoreBlogs.map((item: any) => {
                const itemImg = item.heroImage?.url || '/media/034.webp'
                const formattedDateStr = item.publishedAt
                  ? formatDateNumeric(item.publishedAt)
                  : '05/08/2025'

                return (
                  <article key={item.id} className="nsh-explore-item">
                    {/* Thumbnail Image */}
                    <div className="nsh-explore-thumb">
                      <Link href={`/blogs/${item.slug}`}>
                        <img
                          src={itemImg}
                          alt={item.title}
                          className="w-full h-full object-cover block"
                        />
                      </Link>
                    </div>

                    {/* Title */}
                    <h3 className="nsh-explore-title">
                      <Link
                        href={`/blogs/${item.slug}`}
                        className="text-inherit no-underline hover:text-[#8a561f]"
                        title={item.title}
                      >
                        {item.title}
                      </Link>
                    </h3>

                    {/* Footer Row: Read Post > on left, Date & Read Time on right */}
                    <div className="nsh-explore-footer">
                      <Link
                        href={`/blogs/${item.slug}`}
                        className="text-slate-600 font-semibold text-[0.85rem] no-underline hover:text-[#8a561f]"
                      >
                        Read Post &gt;
                      </Link>

                      <div className="nsh-explore-meta-stack">
                        {formattedDateStr && <span>{formattedDateStr}</span>}
                        <span>{`${item.readingTime || 1} min read`}</span>
                      </div>
                    </div>
                  </article>
                )
              })}
            </div>
          </div>
        </section>
      )}
    </div>
  )
}

const queryBlogBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()
  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'blogs',
    draft,
    limit: 1,
    overrideAccess: draft,
    pagination: false,
    where: {
      slug: {
        equals: slug,
      },
    },
  })

  return result.docs?.[0] || null
})

const queryBlogAndRelatedBySlug = cache(async ({ slug }: { slug: string }) => {
  const { isEnabled: draft } = await draftMode()
  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'blogs',
    draft,
    limit: 1,
    overrideAccess: draft,
    pagination: false,
    where: {
      slug: {
        equals: slug,
      },
    },
  })

  const blog = result.docs?.[0] || null
  if (!blog) return null

  // Fetch 3 explore more blogs
  const exploreResult = await payload.find({
    collection: 'blogs',
    limit: 3,
    sort: '-publishedAt',
    where: {
      id: {
        not_in: [blog.id],
      },
    },
  })

  return {
    blog,
    exploreMoreBlogs: exploreResult.docs || [],
  }
})

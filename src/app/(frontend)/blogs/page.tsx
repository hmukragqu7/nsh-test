import React from 'react'
import { getPayload } from 'payload'
import configPromise from '@payload-config'
import Link from 'next/link'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'Blogs - Novel Signature Homes',
  description:
    'Dive into our blog for Texas real estate insights, tips, and trends. Stay informed on the latest in luxury living, Texas style.',
}

function formatDate(dateString?: string) {
  if (!dateString) return ''
  const d = new Date(dateString)
  const day = String(d.getDate()).padStart(2, '0')
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const year = String(d.getFullYear()).slice(-2)
  return `${month}/${day}/${year}`
}

export default async function BlogsIndexPage() {
  const payload = await getPayload({ config: configPromise })

  const result = await payload.find({
    collection: 'blogs',
    depth: 2,
    sort: '-publishedAt',
    limit: 100,
  })

  const blogs = (result.docs as any[]) || []

  // Identify featured post (Woodland Heights or first post)
  const featuredPost = blogs.find((b) => b.slug?.includes('woodland-heights')) || blogs[0] || null

  const remainingBlogs = featuredPost ? blogs.filter((b) => b.id !== featuredPost.id) : blogs

  // Group remaining blogs dynamically by their Payload categories
  const categoriesMap: Record<string, any[]> = {}

  remainingBlogs.forEach((blog) => {
    if (blog.categories && Array.isArray(blog.categories) && blog.categories.length > 0) {
      blog.categories.forEach((cat: any) => {
        const catTitle = typeof cat === 'object' ? cat?.title : String(cat)
        if (catTitle && catTitle !== 'Featured / Latest') {
          if (!categoriesMap[catTitle]) {
            categoriesMap[catTitle] = []
          }
          if (!categoriesMap[catTitle].some((b) => b.id === blog.id)) {
            categoriesMap[catTitle].push(blog)
          }
        }
      })
    } else {
      const defaultCat = 'General'
      if (!categoriesMap[defaultCat]) {
        categoriesMap[defaultCat] = []
      }
      categoriesMap[defaultCat].push(blog)
    }
  })

  return (
    <div className="bg-white text-[#1a1a1a] min-h-screen">
      <div className="nsh-container">
        {/* Main H1 Title */}
        <div className="nsh-header-divider">
          <h1 className="nsh-title-h1">Blogs</h1>
        </div>

        {/* Featured Top Post */}
        {featuredPost && (
          <section className="max-width mb-18">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
              {/* Left: Featured Image */}
              <div className="rounded-sm overflow-hidden h-[435px] bg-slate-100">
                <Link href={`/blogs/${featuredPost.slug}`}>
                  {featuredPost.heroImage?.url ? (
                    <img
                      src={featuredPost.heroImage.url}
                      alt={featuredPost.heroImage?.alt || featuredPost.title}
                      className="w-full h-full object-cover block"
                    />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center text-5xl">
                      🏡
                    </div>
                  )}
                </Link>
              </div>

              {/* Right: Featured Info */}
              <div className="flex flex-col justify-center">
                <p className="text-[1.05rem] font-normal text-[#1a1a1a] mb-1">Latest</p>

                <p className="nsh-text-meta mb-5">{`${featuredPost.readingTime || 1} min read`}</p>

                <h2 className="nsh-title-h2 mb-5">
                  <Link
                    href={`/blogs/${featuredPost.slug}`}
                    className="text-inherit no-underline"
                  >
                    {featuredPost.title}
                  </Link>
                </h2>

                {featuredPost.excerpt && (
                  <p className="nsh-text-body mb-8">{featuredPost.excerpt}</p>
                )}

                <div>
                  <Link href={`/blogs/${featuredPost.slug}`} className="nsh-btn-black">
                    Read More &gt;&gt;
                  </Link>
                </div>
              </div>
            </div>
          </section>
        )}

        {/* Categorized Sections */}
        {Object.keys(categoriesMap).map((catName) => {
          const categoryBlogs = categoriesMap[catName]
          if (!categoryBlogs || categoryBlogs.length === 0) return null

          const sectionId = `category-${catName.toLowerCase().replace(/[^a-z0-9]+/g, '-')}`

          return (
            <section key={catName} id={sectionId} aria-label={catName} className="max-width mb-16">
              {/* Category Heading */}
              <h2 className="nsh-title-h2 pb-2 border-b border-[#d1d5db] mb-7">{catName}</h2>

              {/* Grid of Posts */}
              <div className="nsh-card-grid">
                {categoryBlogs.map((blog) => (
                  <article key={blog.id} className="nsh-card-base">
                    {/* Hero Thumbnail */}
                    <div className="nsh-card-img-container">
                      <Link href={`/blogs/${blog.slug}`}>
                        {blog.heroImage?.url ? (
                          <img
                            src={blog.heroImage.url}
                            alt={blog.heroImage?.alt || blog.title}
                            className="w-full h-full object-cover block"
                          />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center text-3xl">
                            📖
                          </div>
                        )}
                      </Link>
                    </div>

                    {/* Title with uniform minHeight and 2-line clamp */}
                    <h3 className="nsh-card-title-clamped">
                      <Link
                        href={`/blogs/${blog.slug}`}
                        className="text-inherit no-underline"
                        title={blog.title}
                      >
                        {blog.title}
                      </Link>
                    </h3>

                    {/* Footer Row: Read More + Date / Read time */}
                    <div className="mt-auto flex items-center justify-between text-[0.85rem]">
                      <Link href={`/blogs/${blog.slug}`} className="nsh-link-arrow">
                        Read More
                        <svg
                          width="13"
                          height="14"
                          viewBox="0 0 14 14"
                          fill="none"
                          xmlns="http://www.w3.org/2000/svg"
                        >
                          <path
                            d="M1 7H13M13 7L7 1M13 7L7 13"
                            stroke="currentColor"
                            strokeWidth="1.5"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                          />
                        </svg>
                      </Link>

                      <div className="flex flex-col items-end text-[#8b8b8b] text-[0.8rem]">
                        {blog.publishedAt && <span>{formatDate(blog.publishedAt)}</span>}
                        <span>{`${blog.readingTime || 1} min read`}</span>
                      </div>
                    </div>
                  </article>
                ))}
              </div>
            </section>
          )
        })}
      </div>
    </div>
  )
}

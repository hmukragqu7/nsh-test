import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'
import path from 'path'
import fs from 'fs'

async function populateBlogs() {
  const payload = await getPayload({ config: configPromise })
  const dataPath = '/tmp/blog_assets/blogs_data.json'

  if (!fs.existsSync(dataPath)) {
    console.error('Data file /tmp/blog_assets/blogs_data.json not found!')
    process.exit(1)
  }

  const postsData: any[] = JSON.parse(fs.readFileSync(dataPath, 'utf-8'))
  console.log(`Found ${postsData.length} blog posts to import...`)

  // 1. Ensure categories exist
  const categoryMap: Record<string, any> = {}
  const categoriesList = [
    'Luxury market & investment',
    'Neighborhood & Lifestyle',
    'Design & Craftsmanships',
    'Luxury Buyer Insights',
    'Featured / Latest',
  ]

  for (const catName of categoriesList) {
    const existing = await payload.find({
      collection: 'categories',
      where: {
        title: { equals: catName },
      },
      limit: 1,
    })

    if (existing.docs && existing.docs.length > 0) {
      categoryMap[catName] = existing.docs[0]
      console.log(`Category "${catName}" exists (ID: ${existing.docs[0].id})`)
    } else {
      const created = await payload.create({
        collection: 'categories',
        data: {
          title: catName,
        },
      } as any)
      categoryMap[catName] = created
      console.log(`Created category "${catName}" (ID: ${created.id})`)
    }
  }

  // 2. Upload images and create blogs
  for (const post of postsData) {
    let heroMediaId = null

    if (post.local_img && fs.existsSync(post.local_img)) {
      const altText = post.title
      const existingMedia = await payload.find({
        collection: 'media',
        where: {
          alt: { equals: altText },
        },
        limit: 1,
      })

      if (existingMedia.docs && existingMedia.docs.length > 0) {
        heroMediaId = existingMedia.docs[0].id
        console.log(`Media for "${post.title}" exists (ID: ${heroMediaId})`)
      } else {
        console.log(`Uploading media ${post.local_img_name}...`)
        const uploaded = await payload.create({
          collection: 'media',
          data: {
            alt: altText,
          },
          filePath: post.local_img,
        } as any)
        heroMediaId = uploaded.id
        console.log(`Uploaded media (ID: ${heroMediaId})`)
      }
    }

    // Generate slug from title or url
    const slug = post.url
      .replace(/\/$/, '')
      .split('/')
      .pop() || post.title.toLowerCase().replace(/[^a-z0-9]+/g, '-')

    const categoryObj = categoryMap[post.category]
    const categoriesArray = categoryObj ? [categoryObj.id] : []

    // Lexical RichText node structure for simple paragraphs
    const contentLexical = {
      root: {
        type: 'root',
        format: '',
        indent: 0,
        version: 1,
        children: [
          {
            type: 'paragraph',
            format: '',
            indent: 0,
            version: 1,
            children: [
              {
                type: 'text',
                detail: 0,
                format: 0,
                mode: 'normal',
                style: '',
                text: post.excerpt || post.title,
                version: 1,
              },
            ],
          },
        ],
      },
    }

    const blogDocData: any = {
      title: post.title,
      slug: slug,
      excerpt: post.excerpt || '',
      readTime: post.readTime || '5 mins read',
      publishedAt: post.publishedAt || new Date().toISOString(),
      heroImage: heroMediaId,
      categories: categoriesArray,
      content: contentLexical,
      _status: 'published',
    }

    const existingBlog = await payload.find({
      collection: 'blogs',
      where: {
        slug: { equals: slug },
      },
      limit: 1,
    })

    if (existingBlog.docs && existingBlog.docs.length > 0) {
      await payload.update({
        collection: 'blogs',
        id: existingBlog.docs[0].id,
        context: {
          disableRevalidate: true,
        },
        data: blogDocData,
      } as any)
      console.log(`Updated blog post: "${post.title}" (ID: ${existingBlog.docs[0].id})`)
    } else {
      const createdBlog = await payload.create({
        collection: 'blogs',
        context: {
          disableRevalidate: true,
        },
        data: blogDocData,
      } as any)
      console.log(`Created blog post: "${post.title}" (ID: ${createdBlog.id})`)
    }
  }

  console.log('Successfully populated all 8 blog posts into Payload CMS!')
  process.exit(0)
}

populateBlogs().catch((err) => {
  console.error('Error populating blogs:', err)
  process.exit(1)
})

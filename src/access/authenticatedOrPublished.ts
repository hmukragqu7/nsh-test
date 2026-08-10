import type { Access } from 'payload'

export const authenticatedOrPublished: Access = (args) => {
  console.log("=== authenticatedOrPublished called ===", {
    keys: Object.keys(args),
    reqKeys: args.req ? Object.keys(args.req) : null,
    url: args.req?.url,
    originalUrl: (args.req as any)?.originalUrl
  })

  const { req } = args
  const user = req?.user

  if (user) {
    return true
  }

  // Attempt to read collection configuration from args or req
  const collection = (args as any).collection || (req as any)?.collection
  const collectionConfig = collection?.config || collection
  const hasDrafts = !!collectionConfig?.versions?.drafts

  console.log("Drafts check:", {
    hasDrafts,
    collectionSlug: collection?.slug || (args as any)?.collectionSlug
  })

  // If this collection does not support drafts/versions, it is always public
  if (!hasDrafts) {
    return true
  }

  return {
    _status: {
      equals: 'published',
    },
  }
}

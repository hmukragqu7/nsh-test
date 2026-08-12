/**
 * Utility to extract plain text from Lexical richText AST nodes
 * and calculate estimated reading time in minutes (200 WPM).
 */

// Node types that should be excluded from word count calculation
const EXCLUDED_NODE_TYPES = new Set([
  'code',
  'code-highlight',
  'upload',
  'image',
  'mediaBlock',
  'video',
])

/**
 * Recursively extracts plain text from a Lexical richText AST or string.
 * Ignores HTML tags, code blocks, embeds, image captions, and metadata.
 *
 * @param node - Rich text AST root, node, or raw input
 * @returns Combined plain text string
 */
export function extractPlainText(node: any): string {
  if (!node) return ''

  // If node is a raw string (e.g. plain text or HTML fallback)
  if (typeof node === 'string') {
    return node.replace(/<[^>]*>/g, ' ').trim()
  }

  // Handle number or boolean
  if (typeof node !== 'object') {
    return String(node)
  }

  // Check if this node type is explicitly excluded (e.g. code blocks, media)
  if (node.type && EXCLUDED_NODE_TYPES.has(node.type)) {
    return ''
  }

  // Check blockType if it's a Lexical block node (e.g. Code block or MediaBlock)
  if (node.fields?.blockType && EXCLUDED_NODE_TYPES.has(node.fields.blockType)) {
    return ''
  }

  // Leaf text node in Lexical AST
  if (node.type === 'text' && typeof node.text === 'string') {
    return node.text
  }

  let textParts: string[] = []

  // If node has children array (paragraph, heading, list, listitem, quote, link, root)
  if (Array.isArray(node.children)) {
    for (const child of node.children) {
      const childText = extractPlainText(child)
      if (childText) {
        textParts.push(childText)
      }
    }
  }

  // If node is root object containing root property
  if (node.root && typeof node.root === 'object') {
    const rootText = extractPlainText(node.root)
    if (rootText) {
      textParts.push(rootText)
    }
  }

  return textParts.join(' ')
}

/**
 * Calculates estimated reading time in minutes based on 200 words per minute.
 *
 * Requirements:
 * - 200 WPM
 * - Math.ceil(wordCount / 200)
 * - Returns 0 if empty
 * - Returns minimum 1 minute for small non-empty articles
 *
 * @param content - Lexical rich text AST or content object
 * @param wordsPerMinute - Words per minute rate (default: 200)
 * @returns Estimated reading time in minutes
 */
export function calculateReadingTime(content: any, wordsPerMinute = 200): number {
  const plainText = extractPlainText(content)

  // Normalize whitespace and split into words
  const words = plainText
    .trim()
    .split(/\s+/)
    .filter((word) => word.length > 0)

  const wordCount = words.length

  if (wordCount === 0) {
    return 0
  }

  // Reading time formula: Math.ceil(wordCount / 200)
  const minutes = Math.ceil(wordCount / wordsPerMinute)

  // Edge case: Minimum 1 minute for any non-empty article
  return Math.max(1, minutes)
}

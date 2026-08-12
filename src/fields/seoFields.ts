import type { Field } from 'payload'

/**
 * Advanced SEO fields – added to the `meta` group in every collection.
 * Default fields (title, description, image) are handled separately
 * (by the SEO plugin for Pages/Posts, manually for Properties).
 */
export const advancedSeoFields: Field[] = [
  {
    name: 'focusKeyword',
    type: 'text',
    label: 'Focus Keyword',
    admin: {
      description: 'The primary keyword this page targets. Used to evaluate SEO quality.',
      placeholder: 'e.g. luxury homes Houston Texas',
    },
  },
  {
    name: 'canonicalUrl',
    type: 'text',
    label: 'Canonical URL',
    admin: {
      description: 'Override the canonical URL if this page has a preferred URL (leave blank to use the page URL).',
      placeholder: 'https://example.com/preferred-url',
    },
  },
  {
    name: 'metaRobots',
    type: 'group',
    label: 'Meta Robots',
    admin: {
      description: 'Control how search engines index and follow this page.',
    },
    fields: [
      {
        name: 'indexing',
        type: 'select',
        label: 'Index / Noindex',
        defaultValue: 'index',
        options: [
          { label: 'Index (allow indexing)', value: 'index' },
          { label: 'Noindex (block indexing)', value: 'noindex' },
        ],
      },
      {
        name: 'following',
        type: 'select',
        label: 'Follow / Nofollow',
        defaultValue: 'follow',
        options: [
          { label: 'Follow (pass link equity)', value: 'follow' },
          { label: 'Nofollow (block link equity)', value: 'nofollow' },
        ],
      },
      {
        name: 'noarchive',
        type: 'checkbox',
        label: 'Noarchive',
        defaultValue: false,
        admin: {
          description: 'Prevent search engines from showing a cached version.',
        },
      },
      {
        name: 'nosnippet',
        type: 'checkbox',
        label: 'Nosnippet',
        defaultValue: false,
        admin: {
          description: 'Prevent search engines from showing a text snippet in results.',
        },
      },
    ],
  },
]

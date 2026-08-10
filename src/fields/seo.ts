import type { Field } from 'payload'
import { isAdminOrSeoField } from '../access/roles'

/**
 * Single, comprehensive SEO Group field (named 'meta' for generateMeta & Payload compatibility)
 * Field-level permissions restrict editing strictly to Admins and SEO Editors.
 */
export const seoGroup: Field = {
  name: 'meta',
  type: 'group',
  label: 'SEO & Metadata',
  access: {
    create: isAdminOrSeoField,
    update: isAdminOrSeoField,
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      label: 'Meta Title',
      admin: {
        description: 'Optimal length: 50-60 characters.',
      },
    },
    {
      name: 'description',
      type: 'textarea',
      label: 'Meta Description',
      admin: {
        description: 'Optimal length: 150-160 characters.',
      },
    },
    {
      name: 'image',
      type: 'upload',
      relationTo: 'media',
      label: 'Meta Image / Social Preview Image',
    },
    {
      name: 'canonicalUrl',
      type: 'text',
      label: 'Canonical URL',
      admin: {
        placeholder: 'https://example.com/page-url',
      },
    },
    {
      name: 'robots',
      type: 'select',
      label: 'Robots Directive',
      defaultValue: 'index, follow',
      options: [
        { label: 'Index, Follow (Default)', value: 'index, follow' },
        { label: 'Noindex, Follow', value: 'noindex, follow' },
        { label: 'Index, Nofollow', value: 'index, nofollow' },
        { label: 'Noindex, Nofollow', value: 'noindex, nofollow' },
      ],
    },
    {
      name: 'openGraph',
      type: 'group',
      label: 'Open Graph (Facebook / LinkedIn)',
      fields: [
        {
          name: 'ogTitle',
          type: 'text',
          label: 'Open Graph Title',
        },
        {
          name: 'ogDescription',
          type: 'textarea',
          label: 'Open Graph Description',
        },
        {
          name: 'ogImage',
          type: 'upload',
          relationTo: 'media',
          label: 'Open Graph Image',
        },
      ],
    },
    {
      name: 'twitter',
      type: 'group',
      label: 'Twitter Card',
      fields: [
        {
          name: 'twitterTitle',
          type: 'text',
          label: 'Twitter Title',
        },
        {
          name: 'twitterDescription',
          type: 'textarea',
          label: 'Twitter Description',
        },
      ],
    },
    {
      name: 'focusKeyword',
      type: 'text',
      label: 'Focus Keyword (Optional)',
    },
    {
      name: 'structuredData',
      type: 'json',
      label: 'Structured Data (JSON-LD)',
    },
  ],
}

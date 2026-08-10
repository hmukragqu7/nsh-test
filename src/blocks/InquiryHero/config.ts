import type { Block } from 'payload'
import {
  HeadingFeature,
  LinkFeature,
  UploadFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'

export const InquiryHero: Block = {
  slug: 'inquiryHero',
  interfaceName: 'InquiryHeroBlock',
  labels: {
    singular: 'Inquiry Form / Hero Section',
    plural: 'Inquiry Form / Hero Sections',
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      label: 'Main Heading',
      defaultValue: 'Contact Us',
    },
    {
      name: 'subheading',
      type: 'text',
      label: 'Subheading',
      defaultValue: 'Inquiries',
    },
    {
      name: 'description',
      type: 'textarea',
      label: 'Description Text',
    },
    {
      name: 'image',
      type: 'upload',
      relationTo: 'media',
      label: 'Hero Image',
    },
    {
      name: 'imageUrl',
      type: 'text',
      label: 'Image URL Fallback',
    },

    {
      name: 'selectedForm',
      type: 'relationship',
      relationTo: 'forms',
      label: 'Select CMS Form',
    },
    {
      name: 'formAction',
      type: 'text',
      label: 'Form Action URL Fallback',
      defaultValue: 'https://formspree.io/f/xbjnqkyv',
    },
    {
      name: 'buttonText',
      type: 'text',
      label: 'Submit Button Label',
      defaultValue: 'Submit',
    },
  ],
}

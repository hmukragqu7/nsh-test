import { formBuilderPlugin } from '@payloadcms/plugin-form-builder'
import { nestedDocsPlugin } from '@payloadcms/plugin-nested-docs'
import { redirectsPlugin } from '@payloadcms/plugin-redirects'
import { seoPlugin } from '@payloadcms/plugin-seo'
import { searchPlugin } from '@payloadcms/plugin-search'
import { Plugin } from 'payload'
import { revalidateRedirects } from '@/hooks/revalidateRedirects'
import { GenerateTitle, GenerateURL } from '@payloadcms/plugin-seo/types'
import { FixedToolbarFeature, HeadingFeature, lexicalEditor } from '@payloadcms/richtext-lexical'
import { searchFields } from '@/search/fieldOverrides'
import { advancedSeoFields } from '@/fields/seoFields'
import { beforeSyncWithSearch } from '@/search/beforeSync'
import { pushToFrappeERPHook } from '@/hooks/pushToFrappeERP'
import { syncToCF7TrackerHook } from '@/hooks/syncToCF7Tracker'

import { Page, Post } from '@/payload-types'
import { getServerSideURL } from '@/utilities/getURL'

const generateTitle: GenerateTitle<Post | Page> = ({ doc }) => {
  return doc?.title ? `${doc.title} | Payload Website Template` : 'Payload Website Template'
}

const generateURL: GenerateURL<Post | Page> = ({ doc }) => {
  const url = getServerSideURL()

  return doc?.slug ? `${url}/${doc.slug}` : url
}

export const plugins: Plugin[] = [
  redirectsPlugin({
    collections: ['pages', 'posts'],
    overrides: {
      // @ts-expect-error - This is a valid override, mapped fields don't resolve to the same type
      fields: ({ defaultFields }) => {
        return defaultFields.map((field) => {
          if ('name' in field && field.name === 'from') {
            return {
              ...field,
              admin: {
                description: 'You will need to rebuild the website when changing this field.',
              },
            }
          }
          return field
        })
      },
      hooks: {
        afterChange: [revalidateRedirects],
      },
    },
  }),
  nestedDocsPlugin({
    collections: ['categories'],
    generateURL: (docs) => docs.reduce((url, doc) => `${url}/${doc.slug}`, ''),
  }),
  seoPlugin({
    collections: ['pages', 'posts'],
    generateTitle,
    generateURL,
    uploadsCollection: 'media',
    tabbedUI: true,
    fields: ({ defaultFields }) => [...defaultFields, ...advancedSeoFields],
  }),
  formBuilderPlugin({
    fields: {
      payment: false,
    },
    formOverrides: {
      fields: ({ defaultFields }) => {
        const updatedFields = defaultFields.map((field) => {
          if ('name' in field && field.name === 'confirmationMessage') {
            return {
              ...field,
              editor: lexicalEditor({
                features: ({ rootFeatures }) => {
                  return [
                    ...rootFeatures,
                    FixedToolbarFeature(),
                    HeadingFeature({ enabledHeadingSizes: ['h1', 'h2', 'h3', 'h4'] }),
                  ]
                },
              }),
            }
          }
          return field
        })

        // Append Frappe ERP Form Mapping settings
        updatedFields.push({
          type: 'collapsible',
          label: 'Frappe ERP Mapping & Configuration',
          fields: [
            {
              name: 'enableErpPush',
              type: 'checkbox',
              label: 'Enable Frappe ERP Push',
              defaultValue: false,
            },
            {
              name: 'frappeUrl',
              type: 'text',
              label: 'Form-Specific Frappe URL',
              admin: {
                description: 'Leave blank to use the global fallback URL in Settings.',
                condition: (data) => data?.enableErpPush,
              },
            },
            {
              name: 'apiMethod',
              type: 'text',
              label: 'Form-Specific API Method',
              defaultValue: 'receive_website_lead',
              admin: {
                condition: (data) => data?.enableErpPush,
              },
            },
            {
              name: 'fieldMapping',
              type: 'array',
              label: 'Form Field to Frappe Field Mapping',
              admin: {
                condition: (data) => data?.enableErpPush,
              },
              fields: [
                {
                  name: 'formField',
                  type: 'text',
                  label: 'Form Field Name/Slug (e.g. your-name)',
                  required: true,
                },
                {
                  name: 'frappeField',
                  type: 'text',
                  label: 'Frappe ERP Lead Field (e.g. user_name)',
                  required: true,
                },
              ],
            },
            {
              name: 'staticFields',
              type: 'array',
              label: 'Additional Static Fields',
              admin: {
                condition: (data) => data?.enableErpPush,
              },
              fields: [
                {
                  name: 'frappeField',
                  type: 'text',
                  label: 'Frappe ERP Lead Field (e.g. subject)',
                  required: true,
                },
                {
                  name: 'value',
                  type: 'text',
                  label: 'Static Value',
                  required: true,
                },
              ],
            },
          ],
        })

        return updatedFields
      },
    },
    formSubmissionOverrides: {
      admin: {
        defaultColumns: ['form', 'erpStatus', 'erpLeadId', 'createdAt'],
      },
      fields: ({ defaultFields }) => [
        ...defaultFields,
        {
          name: 'erpStatus',
          type: 'select',
          label: 'ERP Status',
          defaultValue: 'not_configured',
          options: [
            { label: 'Not Configured', value: 'not_configured' },
            { label: 'Success', value: 'success' },
            { label: 'Failed', value: 'failed' },
          ],
          admin: {
            position: 'sidebar',
          },
        },
        {
          name: 'erpLeadId',
          type: 'text',
          label: 'ERP Lead ID',
          admin: {
            position: 'sidebar',
          },
        },
        {
          name: 'erpResponse',
          type: 'textarea',
          label: 'ERP Response/Error',
          admin: {
            position: 'sidebar',
          },
        },
      ],
      hooks: {
        beforeChange: [pushToFrappeERPHook],
        afterChange: [syncToCF7TrackerHook],
      },
    },
  }),
  searchPlugin({
    collections: ['posts'],
    beforeSync: beforeSyncWithSearch,
    searchOverrides: {
      fields: ({ defaultFields }) => {
        return [...defaultFields, ...searchFields]
      },
    },
  }),
]

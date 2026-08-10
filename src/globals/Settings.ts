import type { GlobalConfig } from 'payload'
import { revalidateSettings } from './hooks/revalidateSettings'

export const Settings: GlobalConfig = {
  slug: 'settings',
  access: {
    read: () => true,
  },
  fields: [
    {
      name: 'siteIcon',
      type: 'upload',
      relationTo: 'media',
      label: 'Site Icon (Favicon)',
    },
    {
      name: 'headerLogo',
      type: 'upload',
      relationTo: 'media',
      label: 'Header Logo (Image)',
    },
    {
      name: 'siteUrl',
      type: 'text',
      label: 'Site Address (URL)',
    },
    {
      type: 'collapsible',
      label: 'Frappe ERP Integration Settings',
      fields: [
        {
          name: 'frappeUrl',
          type: 'text',
          label: 'Frappe ERP URL',
          admin: {
            placeholder: 'https://erp.novelsignaturehomes.com',
          },
        },
        {
          name: 'frappeApiKey',
          type: 'text',
          label: 'Frappe API Key',
        },
        {
          name: 'frappeApiSecret',
          type: 'text',
          label: 'Frappe API Secret',
          admin: {
            description: 'API secret corresponding to the API key',
          },
        },
        {
          name: 'frappeApiMethod',
          type: 'text',
          label: 'Frappe API Method',
          defaultValue: 'receive_website_lead',
          admin: {
            placeholder: 'receive_website_lead',
          },
        },
      ],
    },
  ],
  hooks: {
    afterChange: [revalidateSettings],
  },
}

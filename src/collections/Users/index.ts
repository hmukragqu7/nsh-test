import type { CollectionConfig } from 'payload'
import { authenticated } from '@/access/authenticated'
import { canAccessAdminPanel, isAdmin, isAdminField } from '@/access/roles'

export const Users: CollectionConfig = {
  slug: 'users',
  access: {
    // Allows logging into Payload Admin Panel for users with assigned roles
    admin: canAccessAdminPanel,
    // Restrict User creation/deletion/updates strictly to Admins
    create: isAdmin,
    delete: isAdmin,
    update: isAdmin,
    // Read access must be authenticated so logged-in users can load their profile/session
    read: authenticated,
  },
  admin: {
    defaultColumns: ['name', 'email', 'roles'],
    useAsTitle: 'name',
  },
  auth: true,
  fields: [
    {
      name: 'name',
      type: 'text',
    },
    {
      name: 'roles',
      type: 'select',
      hasMany: true,
      required: true,
      defaultValue: ['editor'],
      options: [
        { label: 'Admin', value: 'admin' },
        { label: 'Content Editor', value: 'editor' },
        { label: 'SEO Editor', value: 'seo-editor' },
      ],
      saveToJWT: true,
      access: {
        create: isAdminField,
        update: isAdminField,
      },
    },
    {
      name: 'logoutButton',
      type: 'ui',
      admin: {
        components: {
          Field: '@/components/LogoutButton',
        },
      },
    },
  ],
  timestamps: true,
}

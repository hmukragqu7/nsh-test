import type { CollectionConfig } from 'payload'
import { slugField } from 'payload'
import { authenticatedOrPublished } from '../access/authenticatedOrPublished'
import { isAdminOrEditor, canAccessAdminPanel } from '../access/roles'
import { generatePreviewPath } from '../utilities/generatePreviewPath'
import { advancedSeoFields } from '../fields/seoFields'

export const Properties: CollectionConfig = {
  slug: 'properties',
  admin: {
    useAsTitle: 'name',
    defaultColumns: ['name', 'address', 'price', 'status', 'updatedAt'],
    livePreview: {
      url: ({ data, req }) =>
        generatePreviewPath({
          slug: data?.slug,
          collection: 'properties',
          req,
        }),
    },
    preview: (data, { req }) =>
      generatePreviewPath({
        slug: data?.slug as string,
        collection: 'properties',
        req,
      }),
  },
  access: {
    create: isAdminOrEditor,
    delete: isAdminOrEditor,
    read: authenticatedOrPublished,
    update: canAccessAdminPanel,
  },
  fields: [
    // ── SIDEBAR FIELDS (root level = renders in right sidebar) ──────────────
    {
      name: 'status',
      type: 'select',
      label: 'Property Status',
      defaultValue: 'for_sale',
      options: [
        { label: 'For Sale', value: 'for_sale' },
        { label: 'Sold Out', value: 'sold' },
        { label: 'Under Contract', value: 'under_contract' },
      ],
      admin: { position: 'sidebar' },
    },
    {
      name: 'featured',
      type: 'checkbox',
      label: 'Featured Property',
      defaultValue: false,
      admin: { position: 'sidebar' },
    },
    {
      name: 'isGroupParent',
      type: 'checkbox',
      label: 'Is Group Parent/Community',
      defaultValue: false,
      admin: { position: 'sidebar' },
    },
    {
      name: 'parentProperty',
      type: 'relationship',
      relationTo: 'properties',
      label: 'Parent Community/Group',
      filterOptions: { isGroupParent: { equals: true } },
      admin: { position: 'sidebar' },
    },
    {
      name: 'publishedAt',
      type: 'date',
      admin: { position: 'sidebar' },
    },

    // ── TABS ────────────────────────────────────────────────────────────────
    {
      type: 'tabs',
      tabs: [
        // ── Content tab ───────────────────────────────────────────────────
        {
          label: 'Content',
          fields: [
            {
              name: 'bannerImages',
              type: 'upload',
              relationTo: 'media',
              hasMany: true,
              label: 'Banner Images',
            },
            { name: 'name', type: 'text', required: true, label: 'Name' },
            { name: 'address', type: 'text', label: 'Address' },
            { name: 'price', type: 'text', label: 'Price' },
            { name: 'description', type: 'textarea', label: 'Description' },
            {
              name: 'contactForm',
              type: 'relationship',
              relationTo: 'forms',
              label: 'Contact Form',
              admin: {
                description: 'Select the contact form to display in Section 6.',
              },
            },

            // Property Summary (Single home only)
            {
              name: 'propertySummary',
              type: 'group',
              label: 'Property Summary',
              admin: { condition: (data) => !data?.isGroupParent },
              fields: [
                { name: 'numberOfBeds', type: 'text', label: 'Number of Beds' },
                { name: 'numberOfBaths', type: 'text', label: 'Number of Baths' },
                { name: 'acArea', type: 'text', label: 'AC Area' },
                { name: 'designTheme', type: 'text', label: 'Design Theme' },
              ],
            },

            // Broker Information (Single home only)
            {
              name: 'brokerInformation',
              type: 'group',
              label: 'Broker Information',
              admin: { condition: (data) => !data?.isGroupParent },
              fields: [
                { name: 'brokerName', type: 'text', label: 'Broker Name' },
                { name: 'companyName', type: 'text', label: 'Company Name' },
                { name: 'brokerImage', type: 'upload', relationTo: 'media', label: 'Broker Image' },
              ],
            },

            {
              name: 'builderName',
              type: 'text',
              label: 'Builder Name',
              admin: { condition: (data) => !data?.isGroupParent },
            },
            {
              name: 'architectName',
              type: 'text',
              label: 'Architect Name',
              admin: { condition: (data) => !data?.isGroupParent },
            },
            {
              name: 'interiorDesignName',
              type: 'text',
              label: 'Interior Design Name',
              admin: { condition: (data) => !data?.isGroupParent },
            },

            // Features & Amenities (Single home only)
            {
              name: 'featuresAndAmenities',
              type: 'group',
              label: 'Features And Amenities',
              admin: { condition: (data) => !data?.isGroupParent },
              fields: [
                {
                  name: 'propertyDetails',
                  type: 'group',
                  label: 'Property Details',
                  fields: [
                    { name: 'propertyType', type: 'text', label: 'Property Type' },
                    { name: 'yearBuilt', type: 'text', label: 'Year Built' },
                    {
                      name: 'totalInteriorLivableArea',
                      type: 'text',
                      label: 'Total Interior Livable Area',
                    },
                    { name: 'lotSize', type: 'text', label: 'Lot Size' },
                  ],
                },
                {
                  name: 'bedsAndBaths',
                  type: 'group',
                  label: 'Beds & Baths',
                  fields: [
                    { name: 'beds', type: 'text', label: 'Beds' },
                    { name: 'baths', type: 'text', label: 'Baths' },
                    { name: 'numberOfFloors', type: 'text', label: 'Number of Floors' },
                  ],
                },
                {
                  name: 'interiorFeatures',
                  type: 'group',
                  label: 'Interior Features',
                  fields: [
                    { name: 'firstFloor', type: 'textarea', label: '1st Floor' },
                    { name: 'secondFloor', type: 'textarea', label: '2nd Floor' },
                    { name: 'thirdFloor', type: 'textarea', label: '3rd Floor' },
                    { name: 'additionalFeatures', type: 'textarea', label: 'Additional Features' },
                  ],
                },
                {
                  name: 'exteriorFeatures',
                  type: 'group',
                  label: 'Exterior Features',
                  fields: [
                    { name: 'garage', type: 'text', label: 'Garage' },
                    { name: 'yard', type: 'text', label: 'Yard' },
                    { name: 'siding', type: 'text', label: 'Siding' },
                    { name: 'pool', type: 'text', label: 'Pool' },
                    { name: 'driveway', type: 'text', label: 'Driveway' },
                    { name: 'roof', type: 'text', label: 'Roof' },
                    { name: 'deckPatio', type: 'text', label: 'Deck/ Patio' },
                  ],
                },
              ],
            },

            {
              name: 'allPhotos',
              type: 'upload',
              relationTo: 'media',
              hasMany: true,
              label: 'All Photos',
            },
            {
              name: 'progressPhotos',
              type: 'upload',
              relationTo: 'media',
              hasMany: true,
              label: 'Progress Photos',
              admin: { condition: (data) => !data?.isGroupParent },
            },
            {
              name: 'allFloorPlanPhotos',
              type: 'upload',
              relationTo: 'media',
              hasMany: true,
              label: 'All Floor Plan Photos',
            },

            // Floor Plans
            {
              name: 'floorPlans',
              type: 'array',
              label: 'Floor Plans',
              fields: [
                { name: 'floorName', type: 'text', label: 'Floor Name', required: true },
                { name: 'areaSize', type: 'text', label: 'Area Size (e.g. 3,194 SQFT)' },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Floor Plan Image',
                  required: true,
                },
              ],
            },

            // Video Section (Single home only)
            {
              name: 'video',
              type: 'group',
              label: 'Video Section',
              admin: { condition: (data) => !data?.isGroupParent },
              fields: [
                {
                  name: 'videoType',
                  type: 'select',
                  label: 'Video Source',
                  defaultValue: 'youtube',
                  options: [
                    { label: 'YouTube Link', value: 'youtube' },
                    { label: 'Uploaded Video File', value: 'file' },
                  ],
                },
                {
                  name: 'youtubeUrl',
                  type: 'text',
                  label: 'YouTube URL',
                  admin: {
                    placeholder: 'https://www.youtube.com/watch?v=...',
                    condition: (_, siblingData) => siblingData?.videoType === 'youtube',
                  },
                },
                {
                  name: 'videoFile',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Video File',
                  admin: {
                    condition: (_, siblingData) => siblingData?.videoType === 'file',
                  },
                },
              ],
            },
          ],
        },

        // ── Community Content Tab (For Parent Community pages like Woodland Heights) ──────
        {
          label: 'Community Content',
          admin: {
            condition: (data) => Boolean(data?.isGroupParent),
          },
          fields: [
            // Team & Partners Bar
            {
              name: 'projectTeam',
              type: 'group',
              label: 'Project Team & Partners Bar',
              fields: [
                {
                  name: 'brokerName',
                  type: 'text',
                  label: 'Broker Name',
                  defaultValue: 'Ed Wolff',
                },
                {
                  name: 'builderName',
                  type: 'text',
                  label: 'Builder Name',
                  defaultValue: 'Novel Signature Homes',
                },
                {
                  name: 'architectName',
                  type: 'text',
                  label: 'Architecture Name',
                  defaultValue: 'Todd Rice',
                },
                {
                  name: 'interiorDesignerName',
                  type: 'text',
                  label: 'Interior Designer Name',
                  defaultValue: 'Steve Clifton',
                },
              ],
            },

            // About Section & 3 Glass Cards (Woodland template only)
            {
              name: 'aboutSection',
              type: 'group',
              label: 'About Community Section',
              admin: {
                condition: (data) => {
                  if (!data?.isGroupParent) return false
                  const slug = data?.slug || ''
                  const name = data?.name || ''
                  return (
                    slug !== 'potomac' &&
                    slug !== 'the-potomac' &&
                    !name.toLowerCase().includes('potomac')
                  )
                },
              },
              fields: [
                { name: 'aboutTitle', type: 'text', label: 'About Title', defaultValue: 'About Woodland Heights' },
                { name: 'aboutIntro', type: 'textarea', label: 'About Lead Intro Paragraph' },
                { name: 'aboutBackgroundImage', type: 'upload', relationTo: 'media', label: 'Background Image (Aerial View)' },
                { name: 'historyText', type: 'textarea', label: 'History Card Text' },
                { name: 'lifestyleText', type: 'textarea', label: 'Lifestyle Card Text' },
                { name: 'neighborhoodText', type: 'textarea', label: 'Neighborhood Card Text' },
              ],
            },

            // Expanding Accordion Cards (Woodland template only)
            {
              name: 'neighborhoodAccordion',
              type: 'array',
              label: 'Neighborhood Accordion Cards',
              admin: {
                condition: (data) => {
                  if (!data?.isGroupParent) return false
                  const slug = data?.slug || ''
                  const name = data?.name || ''
                  return (
                    slug !== 'potomac' &&
                    slug !== 'the-potomac' &&
                    !name.toLowerCase().includes('potomac')
                  )
                },
              },
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Card Title (e.g. Woodland Park)',
                  required: true,
                },
                { name: 'distance', type: 'text', label: 'Distance Subtitle (e.g. 1.3 Miles)' },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Card Background Image',
                },
              ],
            },

            // Dark Elegance Banner (Woodland template only)
            {
              name: 'eleganceBanner',
              type: 'group',
              label: 'Dark Elegance Banner',
              admin: {
                condition: (data) => {
                  if (!data?.isGroupParent) return false
                  const slug = data?.slug || ''
                  const name = data?.name || ''
                  return (
                    slug !== 'potomac' &&
                    slug !== 'the-potomac' &&
                    !name.toLowerCase().includes('potomac')
                  )
                },
              },
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Banner Title',
                  defaultValue: 'Experience Elegance In Every Detail',
                },
                { name: 'description', type: 'textarea', label: 'Banner Body Paragraph' },
              ],
            },
          ],
        },

        // ── SEO tab ───────────────────────────────────────────────────────
        {
          label: 'SEO',
          fields: [
            {
              name: 'meta',
              type: 'group',
              label: 'SEO',
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Meta Title',
                  admin: { description: 'Recommended: 50–60 characters.' },
                },
                {
                  name: 'description',
                  type: 'textarea',
                  label: 'Meta Description',
                  admin: { description: 'Recommended: 150–160 characters.' },
                },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'OG / Social Image',
                },
                ...advancedSeoFields,
              ],
            },
          ],
        },
      ],
    },

    // Slug (renders in right sidebar automatically)
    slugField(),
  ],
  timestamps: true,
}

import type { CollectionConfig } from 'payload'
import { slugField } from 'payload'
import { authenticatedOrPublished } from '../access/authenticatedOrPublished'
import { isAdminOrEditor, canAccessAdminPanel } from '../access/roles'
import { generatePreviewPath } from '../utilities/generatePreviewPath'

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
    // Property Status (For Sale / Sold Out / Under Contract)
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
      admin: {
        position: 'sidebar',
      },
    },

    // Featured Checkbox
    {
      name: 'featured',
      type: 'checkbox',
      label: 'Featured Property',
      defaultValue: false,
      admin: {
        position: 'sidebar',
      },
    },

    // Is Group Parent Checkbox
    {
      name: 'isGroupParent',
      type: 'checkbox',
      label: 'Is Group Parent/Community',
      defaultValue: false,
      admin: {
        position: 'sidebar',
      },
    },

    // Parent Property Relationship
    {
      name: 'parentProperty',
      type: 'relationship',
      relationTo: 'properties',
      label: 'Parent Community/Group',
      admin: {
        position: 'sidebar',
      },
      filterOptions: {
        isGroupParent: { equals: true },
      },
    },

    // 1. Banner Images
    {
      name: 'bannerImages',
      type: 'upload',
      relationTo: 'media',
      hasMany: true,
      label: 'Banner Images',
    },

    // 2. Name
    {
      name: 'name',
      type: 'text',
      required: true,
      label: 'Name',
    },

    // 3. Address
    {
      name: 'address',
      type: 'text',
      label: 'Address',
    },

    // 4. Price
    {
      name: 'price',
      type: 'text',
      label: 'Price',
    },

    // Description
    {
      name: 'description',
      type: 'textarea',
      label: 'Description',
    },

    // 5. Property Summary
    {
      name: 'propertySummary',
      type: 'group',
      label: 'Property Summary',
      fields: [
        {
          name: 'numberOfBeds',
          type: 'text',
          label: 'Number of Beds',
        },
        {
          name: 'numberOfBaths',
          type: 'text',
          label: 'Number of Baths',
        },
        {
          name: 'acArea',
          type: 'text',
          label: 'AC Area',
        },
        {
          name: 'designTheme',
          type: 'text',
          label: 'Design Theme',
        },
      ],
    },

    // 6. Broker Information
    {
      name: 'brokerInformation',
      type: 'group',
      label: 'Broker Information',
      fields: [
        {
          name: 'brokerName',
          type: 'text',
          label: 'Broker Name',
        },
        {
          name: 'companyName',
          type: 'text',
          label: 'Company Name',
        },
        {
          name: 'brokerImage',
          type: 'upload',
          relationTo: 'media',
          label: 'Broker Image',
        },
      ],
    },

    // 7. Builder Name
    {
      name: 'builderName',
      type: 'text',
      label: 'Builder Name',
    },

    // 8. Architect Name
    {
      name: 'architectName',
      type: 'text',
      label: 'Architect Name',
    },

    // 9. Interior Design Name
    {
      name: 'interiorDesignName',
      type: 'text',
      label: 'Interior Design Name',
    },

    // 10. Features And Amenities
    {
      name: 'featuresAndAmenities',
      type: 'group',
      label: 'Features And Amenities',
      fields: [
        // a) Property Details
        {
          name: 'propertyDetails',
          type: 'group',
          label: 'Property Details',
          fields: [
            {
              name: 'propertyType',
              type: 'text',
              label: 'Property Type',
            },
            {
              name: 'yearBuilt',
              type: 'text',
              label: 'Year Built',
            },
            {
              name: 'totalInteriorLivableArea',
              type: 'text',
              label: 'Total Interior Livable Area',
            },
            {
              name: 'lotSize',
              type: 'text',
              label: 'Lot Size',
            },
          ],
        },

        // b) Beds & Baths
        {
          name: 'bedsAndBaths',
          type: 'group',
          label: 'Beds & Baths',
          fields: [
            {
              name: 'beds',
              type: 'text',
              label: 'Beds',
            },
            {
              name: 'baths',
              type: 'text',
              label: 'Baths',
            },
            {
              name: 'numberOfFloors',
              type: 'text',
              label: 'Number of Floors',
            },
          ],
        },

        // c) Interior Features
        {
          name: 'interiorFeatures',
          type: 'group',
          label: 'Interior Features',
          fields: [
            {
              name: 'firstFloor',
              type: 'textarea',
              label: '1st Floor',
            },
            {
              name: 'secondFloor',
              type: 'textarea',
              label: '2nd Floor',
            },
            {
              name: 'thirdFloor',
              type: 'textarea',
              label: '3rd Floor',
            },
            {
              name: 'additionalFeatures',
              type: 'textarea',
              label: 'Additional Features',
            },
          ],
        },

        // d) Exterior Features
        {
          name: 'exteriorFeatures',
          type: 'group',
          label: 'Exterior Features',
          fields: [
            {
              name: 'garage',
              type: 'text',
              label: 'Garage',
            },
            {
              name: 'yard',
              type: 'text',
              label: 'Yard',
            },
            {
              name: 'siding',
              type: 'text',
              label: 'Siding',
            },
            {
              name: 'pool',
              type: 'text',
              label: 'Pool',
            },
            {
              name: 'driveway',
              type: 'text',
              label: 'Driveway',
            },
            {
              name: 'roof',
              type: 'text',
              label: 'Roof',
            },
            {
              name: 'deckPatio',
              type: 'text',
              label: 'Deck/ Patio',
            },
          ],
        },
      ],
    },

    // 11. All Photos
    {
      name: 'allPhotos',
      type: 'upload',
      relationTo: 'media',
      hasMany: true,
      label: 'All Photos',
    },

    // 11b. Progress Photos
    {
      name: 'progressPhotos',
      type: 'upload',
      relationTo: 'media',
      hasMany: true,
      label: 'Progress Photos',
    },

    // 12. All Floor Plan Photos
    {
      name: 'allFloorPlanPhotos',
      type: 'upload',
      relationTo: 'media',
      hasMany: true,
      label: 'All Floor Plan Photos',
    },

    // 12b. Floor Plans List
    {
      name: 'floorPlans',
      type: 'array',
      label: 'Floor Plans',
      fields: [
        {
          name: 'floorName',
          type: 'text',
          label: 'Floor Name',
          required: true,
        },
        {
          name: 'areaSize',
          type: 'text',
          label: 'Area Size (e.g. 3,194 SQFT)',
        },
        {
          name: 'image',
          type: 'upload',
          relationTo: 'media',
          label: 'Floor Plan Image',
          required: true,
        },
      ],
    },

    // 13. Video Section
    {
      name: 'video',
      type: 'group',
      label: 'Video Section',
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

    // URL slug for frontend dynamic page routing
    slugField(),
  ],
  timestamps: true,
}

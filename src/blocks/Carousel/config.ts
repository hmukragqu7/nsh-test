import type { Block } from 'payload'

export const Carousel: Block = {
  slug: 'carousel',
  interfaceName: 'CarouselBlock',
  fields: [
    {
      name: 'title',
      type: 'text',
      label: 'Carousel Title (Optional)',
    },
    {
      name: 'slides',
      type: 'array',
      required: true,
      minRows: 1,
      maxRows: 10,
      labels: {
        singular: 'Slide',
        plural: 'Slides',
      },
      fields: [
        {
          name: 'image',
          type: 'upload',
          relationTo: 'media',
          required: true,
        },
        {
          name: 'heading',
          type: 'text',
          label: 'Slide Heading',
        },
        {
          name: 'caption',
          type: 'textarea',
          label: 'Slide Caption',
        },
      ],
    },
  ],
}

import type { CollectionConfig, Field } from 'payload'
import {
  BlocksFeature,
  FixedToolbarFeature,
  HeadingFeature,
  HorizontalRuleFeature,
  InlineToolbarFeature,
  LinkFeature,
  UploadFeature,
  lexicalEditor,
} from '@payloadcms/richtext-lexical'
import { Banner } from '../../blocks/Banner/config'
import { Code } from '../../blocks/Code/config'

import { authenticatedOrPublished } from '../../access/authenticatedOrPublished'
import {
  canAccessAdminPanel,
  isAdminOrEditor,
  isAdminOrEditorField,
} from '../../access/roles'
import { Archive } from '../../blocks/ArchiveBlock/config'
import { CallToAction } from '../../blocks/CallToAction/config'
import { Carousel } from '../../blocks/Carousel/config'
import { Content } from '../../blocks/Content/config'
import { FormBlock } from '../../blocks/Form/config'
import { MediaBlock } from '../../blocks/MediaBlock/config'
import { InquiryHero } from '../../blocks/InquiryHero/config'
import { hero } from '@/heros/config'
import { slugField } from 'payload'
import { populatePublishedAt } from '../../hooks/populatePublishedAt'
import { generatePreviewPath } from '../../utilities/generatePreviewPath'
import { revalidateDelete, revalidatePage } from './hooks/revalidatePage'

export const Pages: CollectionConfig<'pages'> = {
  slug: 'pages',
  access: {
    // SEO Editors can view all pages, but cannot create or delete pages
    create: isAdminOrEditor,
    delete: isAdminOrEditor,
    read: authenticatedOrPublished,
    update: canAccessAdminPanel,
  },
  defaultPopulate: {
    title: true,
    slug: true,
  },
  admin: {
    defaultColumns: ['title', 'slug', 'updatedAt'],
    livePreview: {
      url: ({ data, req }) =>
        generatePreviewPath({
          slug: data?.slug,
          collection: 'pages',
          req,
        }),
    },
    preview: (data, { req }) =>
      generatePreviewPath({
        slug: data?.slug as string,
        collection: 'pages',
        req,
      }),
    useAsTitle: 'title',
  },
  fields: [
    {
      type: 'tabs',
      tabs: [
        {
          label: 'Page Content',
          fields: [
            {
              name: 'title',
              type: 'text',
              required: true,
              access: {
                create: isAdminOrEditorField,
                update: isAdminOrEditorField,
              },
            },
            {
              name: 'homeHero',
              label: 'Hero Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Luxury Redefined' },
                { name: 'description', type: 'textarea', defaultValue: 'Experience unparalleled luxury living with our meticulously crafted high-end homes' },
                { name: 'videoUrl', type: 'text', defaultValue: '/media/WEBSITE-1.mov' },
                { name: 'buttonText', type: 'text', defaultValue: 'View All Properties' },
                { name: 'buttonLink', type: 'text', defaultValue: '/properties' },
              ],
            },
            {
              name: 'featuredPropertiesOverride',
              label: 'Featured Properties Slider',
              type: 'array',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              defaultValue: [
                {
                  name: 'The Potomac',
                  details: '4 BD | AC Area: 4,500 – 5,500 Sqft',
                  image: '/media/Potomac_Exterior_Updated.webp',
                  href: '/properties/potomac',
                },
                {
                  name: 'Heatherglen',
                  details: '4 BD | AC Area: 5,366 Sqft',
                  image: '/media/034.webp',
                  href: '/properties/4927-heatherglen-drive-houston-texas-77096',
                },
              ],
              fields: [
                { name: 'name', type: 'text' },
                { name: 'details', type: 'text' },
                { name: 'image', type: 'text' },
                { name: 'href', type: 'text' },
              ],
            },
            {
              name: 'timelessComfort',
              label: 'Timeless Comfort Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Timeless Comfort In Every Detail' },
                { name: 'description', type: 'textarea', defaultValue: 'We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.' },
                { name: 'buttonText', type: 'text', defaultValue: 'About Us' },
                { name: 'buttonLink', type: 'text', defaultValue: '/about' },
              ],
            },
            {
              name: 'whyChooseUs',
              label: 'Why Choose Us Section',
              type: 'array',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              defaultValue: [
                {
                  label: 'INDULGE',
                  heading: 'In Ultimate Luxury',
                  text: 'Every home reflects our commitment to excellence, blending meticulous craftsmanship with the finest materials. Designed by industry experts, from foundation to finishing, our spaces redefine luxury living. Experience unmatched quality and service, crafted just for you.',
                },
                {
                  label: 'IMAGINE',
                  heading: 'Your Future Home Today',
                  text: 'Visualize your dream home with the latest technology. Our 3D designs, virtual reality, and augmented reality experiences let you explore every detail in stunning clarity. Immerse yourself in the world of possibilities and bring your vision to life before a single brick is laid.',
                },
                {
                  label: 'DISCOVER',
                  heading: 'Your Perfect Oasis',
                  text: 'We believe that location is everything. Our experts carefully select prime locations that offer tranquillity, convenience, and prestige. Enjoy seamless access to top schools, parks, hospitals, and major highways, providing effortless connectivity.',
                },
              ],
              fields: [
                { name: 'label', type: 'text' },
                { name: 'heading', type: 'text' },
                { name: 'text', type: 'textarea' },
              ],
            },
            {
              name: 'vrTour',
              label: 'Virtual Reality Tour Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Experience Your Future Home' },
                { name: 'description', type: 'textarea', defaultValue: "Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built." },
                { name: 'bannerImage', type: 'text', defaultValue: '/media/3dtour.webp' },
                { name: 'buttonText', type: 'text', defaultValue: 'Take a Virtual Tour' },
                { name: 'buttonLink', type: 'text', defaultValue: '/properties' },
              ],
            },
            {
              name: 'concierge',
              label: 'Concierge Services Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Our Concierge Services' },
                { name: 'description', type: 'textarea', defaultValue: "We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless." },
                { name: 'image', type: 'text', defaultValue: '/media/concierge-services.webp' },
                { name: 'buttonText', type: 'text', defaultValue: 'Learn More' },
                { name: 'buttonLink', type: 'text', defaultValue: '/concierge' },
              ],
            },
            {
              name: 'newestResidences',
              label: 'Newest Residences Video Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Explore Our Newest Residences' },
                { name: 'description', type: 'textarea', defaultValue: 'Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.' },
                { name: 'youtubeUrl', type: 'text', defaultValue: 'https://www.youtube.com/embed/iDv2I89i8QY?rel=0' },
                { name: 'subscribeLink', type: 'text', defaultValue: 'https://www.youtube.com/@NovelSignatureHomes/videos' },
              ],
            },
            {
              name: 'homeContact',
              label: 'Contact Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'home',
              },
              fields: [
                { name: 'heading', type: 'text', defaultValue: "LET'S FIND YOUR DREAM HOME TOGETHER" },
              ],
            },
            {
              name: 'propertiesPageHeader',
              label: 'Properties Page Header Section',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'properties',
              },
              fields: [
                { name: 'title', type: 'text', defaultValue: 'Luxury Homes For Sale In Texas' },
                { name: 'description', type: 'textarea', defaultValue: "Texas luxury living starts with Novel Signature Homes. Whether you're seeking a grand estate with panoramic views or a cozy retreat with modern elegance, our selection of luxury homes for sale in Texas is second to none. Let us bring you closer to your dream home—where every detail is crafted to perfection." },
                { name: 'sectionHeading', type: 'text', defaultValue: 'Our Properties' },
              ],
            },
            {
              name: 'conciergePage',
              label: 'Concierge Page Settings',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'concierge-service' || data?.slug === 'concierge',
              },
              fields: [
                {
                  name: 'hero',
                  type: 'group',
                  label: 'Hero Section',
                  fields: [
                    { name: 'title', type: 'text', defaultValue: 'Concierge Service' },
                    {
                      name: 'description',
                      type: 'textarea',
                      defaultValue:
                        'At Novel Signature Homes, we believe luxury living is not just about owning a beautifully designed home—it’s about the effortless experience that comes with it. That’s why we offer a premium suite of Concierge Services exclusively for our homeowners, ensuring every step of your transition is smooth and stress-free. From connecting you with our trusted network of vetted suppliers and contractors to providing personalized support for enhancing your new home, we have got all covered for you. With Novel Signature Homes, your journey to luxury living doesn’t end with the purchase—it’s where it begins.',
                    },
                    { name: 'bannerImage', type: 'text', defaultValue: '/media/concierge/hero-banner.webp' },
                  ],
                },
                {
                  name: 'services',
                  type: 'group',
                  label: 'Our Services Section',
                  fields: [
                    { name: 'heading', type: 'text', defaultValue: 'Our Services' },
                    {
                      name: 'items',
                      type: 'array',
                      label: 'Services List',
                      fields: [
                        { name: 'title', type: 'text' },
                        { name: 'icon', type: 'text' },
                      ],
                    },
                  ],
                },
                {
                  name: 'howItWorks',
                  type: 'group',
                  label: 'How It Works Section',
                  fields: [
                    { name: 'heading', type: 'text', defaultValue: 'How it works' },
                    {
                      name: 'image',
                      type: 'text',
                      defaultValue: '/media/concierge/howitwork.webp',
                    },
                    {
                      name: 'steps',
                      type: 'array',
                      label: 'Steps List',
                      fields: [
                        { name: 'stepNumber', type: 'text' },
                        { name: 'title', type: 'text' },
                        { name: 'description', type: 'textarea' },
                        { name: 'icon', type: 'text' },
                      ],
                    },
                  ],
                },
                {
                  name: 'whyLoveIt',
                  type: 'group',
                  label: 'Why Homeowners Love It Section',
                  fields: [
                    { name: 'heading', type: 'text', defaultValue: 'Why Homeowners Love It' },
                    {
                      name: 'cards',
                      type: 'array',
                      label: 'Features List',
                      fields: [
                        { name: 'tag', type: 'text' },
                        { name: 'description', type: 'textarea' },
                      ],
                    },
                  ],
                },
                {
                  name: 'contactForm',
                  type: 'group',
                  label: 'Contact Form Section',
                  fields: [
                    { name: 'heading', type: 'text', defaultValue: "Let's Make Your Move Effortless" },
                    {
                      name: 'subheading',
                      type: 'textarea',
                      defaultValue:
                        'Move into your dream home without the stress of endless decisions or countless hours searching for the right services.',
                    },
                  ],
                },
              ],
            },
            {
              name: 'aboutPage',
              label: 'About Page Settings',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'about',
              },
              fields: [
                {
                  label: 'Our Story (Section 1)',
                  type: 'collapsible',
                  fields: [
                    {
                      name: 'storyTitle',
                      type: 'text',
                      defaultValue: 'Our Story',
                    },
                    {
                      name: 'bannerImage',
                      type: 'text',
                      defaultValue: '/media/about/ourstorybanner.webp',
                    },
                    {
                      name: 'paragraph1',
                      type: 'textarea',
                      defaultValue:
                        'At Novel Signature Homes, we craft luxurious homes that blend timeless elegance with modern innovation. Our story began as part of the Novel Group—a diverse conglomerate with a vast commercial portfolio, expertise in IT services, cable distribution, real estate, and innovative solutions—established in 1993 in Dallas, TX. Over the years, we have built a reputation for fast delivery of office spaces, setting industry standards with customized layouts and zero material wastage.',
                    },
                    {
                      name: 'paragraph2',
                      type: 'textarea',
                      defaultValue:
                        'Building on this legacy, Novel Signature Homes is redefining residential property development. We specialize in bespoke villas and single-unit luxury homes that reflect open-concept designs, quality and craftsmanship. Located in prime areas, our properties offer easy access to premium amenities and vibrant neighborhoods. Our journey is driven by a commitment to excellence. Partnering with leading architects and designers, we seamlessly integrate elegance with eco-friendly features, ensuring that your home is as responsible as it is beautiful.',
                    },
                  ],
                },
                {
                  label: 'Vision, Mission & Values (Section 2)',
                  type: 'collapsible',
                  fields: [
                    {
                      name: 'visionTitle',
                      type: 'text',
                      defaultValue: 'Our Vision',
                    },
                    {
                      name: 'visionText',
                      type: 'textarea',
                      defaultValue:
                        'To set a new standard in the residential real estate by crafting luxury homes that blend timeless elegance with modern innovation.',
                    },
                    {
                      name: 'missionTitle',
                      type: 'text',
                      defaultValue: 'Our Mission',
                    },
                    {
                      name: 'missionText',
                      type: 'textarea',
                      defaultValue:
                        'Creating exceptional homes that inspire, enrich lives, and deliver unmatched quality, innovation, and customer satisfaction.',
                    },
                    {
                      name: 'valuesTitle',
                      type: 'text',
                      defaultValue: 'Our Values',
                    },
                    {
                      name: 'valuesText',
                      type: 'textarea',
                      defaultValue:
                        'Deliver excellence through top-tier craftsmanship, innovative designs, and a client-first approach rooted in integrity.',
                    },
                  ],
                },
                {
                  label: 'Why Choose Us (Section 3)',
                  type: 'collapsible',
                  fields: [
                    {
                      name: 'whyHeadingPrefix',
                      type: 'text',
                      defaultValue: 'Why Choose',
                    },
                    {
                      name: 'whyHeadingMain',
                      type: 'text',
                      defaultValue: 'Novel Signature Homes ?',
                    },
                    {
                      name: 'whySubtitle',
                      type: 'text',
                      defaultValue: 'Everyday, we work hard to make our clients’ lives better and happier.',
                    },
                    {
                      name: 'whyImage',
                      type: 'text',
                      defaultValue: '/media/about/whychoose.webp',
                    },
                    {
                      name: 'feature1',
                      type: 'textarea',
                      defaultValue:
                        'Experience the finest materials and careful attention to detail with superior craftsmanship.',
                    },
                    {
                      name: 'feature2',
                      type: 'textarea',
                      defaultValue:
                        'Live in Texas’s most desirable and well-connected neighborhoods with prime locations.',
                    },
                    {
                      name: 'feature3',
                      type: 'textarea',
                      defaultValue:
                        'Enjoy living without compromising on elegance through luxury.',
                    },
                    {
                      name: 'feature4',
                      type: 'textarea',
                      defaultValue:
                        'Enjoy exceptional customer care from start to finish, with our signature white-glove service.',
                    },
                  ],
                },
                {
                  label: 'Contact Form (Section 4)',
                  type: 'collapsible',
                  fields: [
                    {
                      name: 'contactHeading',
                      type: 'text',
                      defaultValue: "Let's Find Your Dream Home Together",
                    },
                  ],
                },
              ],
            },
            {
              ...hero,
              admin: {
                hidden: true,
              },
              access: {
                create: isAdminOrEditorField,
                update: isAdminOrEditorField,
              },
            } as Field,
            {
              name: 'layout',
              type: 'blocks',
              blocks: [InquiryHero, CallToAction, Content, MediaBlock, Archive, FormBlock, Carousel],
              required: false,
              admin: {
                initCollapsed: false,
              },
              access: {
                create: isAdminOrEditorField,
                update: isAdminOrEditorField,
              },
            },
            {
              name: 'privacyPolicyPage',
              label: 'Privacy Policy Page Settings',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'privacy-policy' || data?.slug === 'privacy',
              },
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Main Heading',
                  defaultValue: 'Privacy Policy',
                },
                {
                  name: 'effectiveDate',
                  type: 'text',
                  label: 'Effective Date',
                  defaultValue: 'Effective as of April 5, 2025',
                },
                {
                  name: 'sections',
                  label: 'Policy Sections',
                  type: 'array',
                  admin: {
                    initCollapsed: false,
                  },
                  fields: [
                    {
                      name: 'heading',
                      type: 'text',
                      label: 'Section Heading (e.g. 1. Introduction)',
                      required: true,
                    },
                    {
                      name: 'content',
                      type: 'richText',
                      label: 'Section Content',
                      editor: lexicalEditor({
                        features: ({ rootFeatures }) => [
                          ...rootFeatures,
                          HeadingFeature({ enabledHeadingSizes: ['h2', 'h3', 'h4'] }),
                          BlocksFeature({ blocks: [Banner, Code, MediaBlock] }),
                          FixedToolbarFeature(),
                          InlineToolbarFeature(),
                          HorizontalRuleFeature(),
                        ],
                      }),
                    },
                  ],
                },
              ],
            },
            {
              name: 'termsAndConditionsPage',
              label: 'Terms and Conditions Page Settings',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'terms-and-conditions' || data?.slug === 'terms',
              },
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Main Heading',
                  defaultValue: 'Terms and Conditions',
                },
                {
                  name: 'subheading',
                  type: 'text',
                  label: 'Subheading',
                  defaultValue: 'Terms and condition',
                },
                {
                  name: 'effectiveDate',
                  type: 'text',
                  label: 'Effective Date',
                  defaultValue: 'Effective as of April 5, 2025',
                },
                {
                  name: 'sections',
                  label: 'Policy Sections',
                  type: 'array',
                  admin: {
                    initCollapsed: false,
                  },
                  fields: [
                    {
                      name: 'heading',
                      type: 'text',
                      label: 'Section Heading (e.g. Acceptance of the Terms)',
                      required: true,
                    },
                    {
                      name: 'content',
                      type: 'richText',
                      label: 'Section Content',
                      editor: lexicalEditor({
                        features: ({ rootFeatures }) => [
                          ...rootFeatures,
                          HeadingFeature({ enabledHeadingSizes: ['h2', 'h3', 'h4'] }),
                          BlocksFeature({ blocks: [Banner, Code, MediaBlock] }),
                          FixedToolbarFeature(),
                          InlineToolbarFeature(),
                          HorizontalRuleFeature(),
                        ],
                      }),
                    },
                  ],
                },
              ],
            },
            {
              name: 'buyAHomePage',
              label: 'Buy A Home Page Settings',
              type: 'group',
              admin: {
                condition: () => false,
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
                  defaultValue: 'Buy A Home',
                },
                {
                  name: 'description',
                  type: 'textarea',
                  label: 'Description Text',
                  defaultValue:
                    'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.',
                },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Hero Background Image',
                },
                {
                  name: 'imageUrl',
                  type: 'text',
                  label: 'Image URL (Fallback if no Media uploaded)',
                  defaultValue: '/media/buy-a-home-sales.webp',
                },
                {
                  name: 'additionalContent',
                  type: 'richText',
                  label: 'In-Between Custom Content (Text, Images, Media, Links, Custom Blocks)',
                  editor: lexicalEditor({
                    features: ({ rootFeatures }) => [
                      ...rootFeatures,
                      BlocksFeature({ blocks: [Banner, Code, MediaBlock, CallToAction, InquiryHero] }),
                    ],
                  }),
                },
                {
                  name: 'selectedForm',
                  type: 'relationship',
                  relationTo: 'forms',
                  label: 'Select CMS Form to Display',
                },
                {
                  name: 'formAction',
                  type: 'text',
                  label: 'Form Action URL (Fallback if no CMS Form selected)',
                  defaultValue: 'https://formspree.io/f/xbjnqkyv',
                },
                {
                  name: 'buttonText',
                  type: 'text',
                  label: 'Submit Button Label',
                  defaultValue: 'Submit',
                },
              ],
            },
            {
              name: 'otherInquiriesPage',
              label: 'Other Inquiries Page Settings',
              type: 'group',
              admin: {
                condition: () => false,
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
                  defaultValue: 'Other Inquiries',
                },
                {
                  name: 'description',
                  type: 'textarea',
                  label: 'Description Text',
                  defaultValue:
                    'Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!',
                },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Hero Background Image',
                },
                {
                  name: 'imageUrl',
                  type: 'text',
                  label: 'Image URL (Fallback if no Media uploaded)',
                  defaultValue: '/media/other-inquiries-hero.webp',
                },
                {
                  name: 'additionalContent',
                  type: 'richText',
                  label: 'In-Between Custom Content (Text, Images, Media, Links, Custom Blocks)',
                  editor: lexicalEditor({
                    features: ({ rootFeatures }) => [
                      ...rootFeatures,
                      BlocksFeature({ blocks: [Banner, Code, MediaBlock, CallToAction, InquiryHero] }),
                    ],
                  }),
                },
                {
                  name: 'selectedForm',
                  type: 'relationship',
                  relationTo: 'forms',
                  label: 'Select CMS Form to Display',
                },
                {
                  name: 'formAction',
                  type: 'text',
                  label: 'Form Action URL (Fallback if no CMS Form selected)',
                  defaultValue: 'https://formspree.io/f/xbjnqkyv',
                },
                {
                  name: 'buttonText',
                  type: 'text',
                  label: 'Submit Button Label',
                  defaultValue: 'Submit',
                },
              ],
            },
            {
              name: 'tradeInquiryPage',
              label: 'Trade Inquiry Page Settings',
              type: 'group',
              admin: {
                condition: () => false,
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
                  defaultValue: 'Trade Inquiry',
                },
                {
                  name: 'description',
                  type: 'textarea',
                  label: 'Description Text',
                  defaultValue:
                    'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.',
                },
                {
                  name: 'image',
                  type: 'upload',
                  relationTo: 'media',
                  label: 'Hero Background Image',
                },
                {
                  name: 'imageUrl',
                  type: 'text',
                  label: 'Image URL (Fallback if no Media uploaded)',
                  defaultValue: '/media/trade-inquiry-hero.webp',
                },
                {
                  name: 'additionalContent',
                  type: 'richText',
                  label: 'In-Between Custom Content (Text, Images, Media, Links, Custom Blocks)',
                  editor: lexicalEditor({
                    features: ({ rootFeatures }) => [
                      ...rootFeatures,
                      BlocksFeature({ blocks: [Banner, Code, MediaBlock, CallToAction, InquiryHero] }),
                    ],
                  }),
                },
                {
                  name: 'selectedForm',
                  type: 'relationship',
                  relationTo: 'forms',
                  label: 'Select CMS Form to Display',
                },
                {
                  name: 'formAction',
                  type: 'text',
                  label: 'Form Action URL (Fallback if no CMS Form selected)',
                  defaultValue: 'https://formspree.io/f/xbjnqkyv',
                },
                {
                  name: 'buttonText',
                  type: 'text',
                  label: 'Submit Button Label',
                  defaultValue: 'Submit',
                },
              ],
            },
            {
              name: 'thankYouPage',
              label: 'Thank You Page Settings',
              type: 'group',
              admin: {
                condition: (data) => data?.slug === 'thank-you',
              },
              fields: [
                {
                  name: 'title',
                  type: 'text',
                  label: 'Main Heading',
                  defaultValue: 'Thank You',
                },
                {
                  name: 'subheading',
                  type: 'text',
                  label: 'Subheading',
                  defaultValue: 'Thank You for Reaching Out',
                },
                {
                  name: 'message',
                  type: 'textarea',
                  label: 'Thank You Message',
                  defaultValue:
                    'We have received your message and will get back to you shortly.',
                },
                {
                  name: 'additionalContent',
                  type: 'richText',
                  label: 'In-Between Custom Content (Text, Images, Media, Links, Custom Blocks)',
                  editor: lexicalEditor({
                    features: ({ rootFeatures }) => [
                      ...rootFeatures,
                      BlocksFeature({ blocks: [Banner, Code, MediaBlock, CallToAction, InquiryHero] }),
                    ],
                  }),
                },
                {
                  name: 'buttonText',
                  type: 'text',
                  label: 'Button Label',
                  defaultValue: 'Back to Home',
                },
                {
                  name: 'buttonLink',
                  type: 'text',
                  label: 'Button Link URL',
                  defaultValue: '/',
                },
              ],
            },
          ],
        },
      ],
    },
    {
      name: 'publishedAt',
      type: 'date',
      admin: {
        position: 'sidebar',
      },
      access: {
        create: isAdminOrEditorField,
        update: isAdminOrEditorField,
      },
    },
    slugField(),
  ],
  hooks: {
    afterChange: [revalidatePage],
    beforeChange: [populatePublishedAt],
    afterDelete: [revalidateDelete],
  },
  versions: {
    drafts: {
      autosave: {
        interval: 100,
      },
      schedulePublish: true,
    },
    maxPerDoc: 50,
  },
}

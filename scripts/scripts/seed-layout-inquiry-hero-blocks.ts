import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedLayoutInquiryHeroBlocks() {
  const payload = await getPayload({ config: configPromise })

  const pagesToMigrate = [
    {
      slug: 'buy-a-home',
      groupKey: 'buyAHomePage',
      defaultTitle: 'Contact Us',
      defaultSubheading: 'Buy A Home',
      defaultDesc:
        'Are you looking for your dream luxury home? We are here for you to guide every step of the way, from exploring the properties to scheduling a walkthrough of any of our properties of your choice with detailed information on our inventory.',
      defaultImage: '/media/buy-a-home-sales.webp',
      formTitle: 'Buy A Home Inquiry Form',
    },
    {
      slug: 'other-inquiries',
      groupKey: 'otherInquiriesPage',
      defaultTitle: 'Contact Us',
      defaultSubheading: 'Other Inquiries',
      defaultDesc:
        'Have any queries about homes, neighborhoods, or designs? We are here for you to assist and provide the answers you need. Reach out to us!',
      defaultImage: '/media/other-inquiries-hero.webp',
      formTitle: 'Other Inquiries Form',
    },
    {
      slug: 'trade-inquiry',
      groupKey: 'tradeInquiryPage',
      defaultTitle: 'Contact Us',
      defaultSubheading: 'Trade Inquiry',
      defaultDesc:
        'We value strong partnerships and are always eager to work with skilled professionals and reliable partners who can help us and be of service to our organization. Reach out to us; we’d love to collaborate.',
      defaultImage: '/media/trade-inquiry-hero.webp',
      formTitle: 'Trade Inquiry Form',
    },
  ]

  for (const item of pagesToMigrate) {
    const pageRes = await payload.find({
      collection: 'pages',
      where: { slug: { equals: item.slug } },
      limit: 1,
    })

    const formRes = await payload.find({
      collection: 'forms',
      where: { title: { equals: item.formTitle } },
      limit: 1,
    })

    if (pageRes.docs?.[0]) {
      const pageDoc = pageRes.docs[0] as any
      const existingGroup = pageDoc[item.groupKey] || {}
      const formDoc = formRes.docs?.[0]

      const inquiryHeroBlock = {
        blockType: 'inquiryHero',
        title: existingGroup.title || item.defaultTitle,
        subheading: existingGroup.subheading || item.defaultSubheading,
        description: existingGroup.description || item.defaultDesc,
        imageUrl: existingGroup.imageUrl || item.defaultImage,
        image: existingGroup.image?.id || existingGroup.image || null,
        additionalContent: existingGroup.additionalContent || null,
        selectedForm: existingGroup.selectedForm?.id || existingGroup.selectedForm || formDoc?.id || null,
        formAction: existingGroup.formAction || 'https://formspree.io/f/xbjnqkyv',
        buttonText: existingGroup.buttonText || 'Submit',
      }

      const currentLayout = Array.isArray(pageDoc.layout) ? pageDoc.layout : []
      const hasInquiryHero = currentLayout.some((b: any) => b.blockType === 'inquiryHero')

      const updatedLayout = hasInquiryHero
        ? currentLayout
        : [inquiryHeroBlock, ...currentLayout]

      await payload.update({
        collection: 'pages',
        id: pageDoc.id,
        context: { disableRevalidate: true },
        data: {
          layout: updatedLayout,
        } as any,
      })

      console.log(`Updated Page "${item.slug}" (ID: ${pageDoc.id}) with InquiryHero block in Layout!`)
    }
  }

  console.log('Successfully populated InquiryHero blocks into page Layouts!')
  process.exit(0)
}

seedLayoutInquiryHeroBlocks().catch((err) => {
  console.error('Error seeding layout inquiry hero blocks:', err)
  process.exit(1)
})

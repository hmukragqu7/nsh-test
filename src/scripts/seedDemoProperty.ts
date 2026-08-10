import 'dotenv/config'
import configPromise from '@payload-config'
import { getPayload } from 'payload'

async function seedDemoProperty() {
  console.log('🏡 Seeding parent and child properties to construct group landing communities...')
  const payload = await getPayload({ config: configPromise })

  const mediaDocs = await payload.find({
    collection: 'media',
    limit: 5,
  })

  const sampleMediaId = mediaDocs.docs[0]?.id

  // 1. Delete all existing properties to prevent duplication and mismatching
  const allProps = await payload.find({
    collection: 'properties',
    limit: 100,
  })
  for (const doc of allProps.docs) {
    await payload.delete({
      collection: 'properties',
      id: doc.id,
    })
    console.log(`Deleted existing property: ${doc.name}`)
  }

  // 2. Create Parent Communities
  const potomacParent = await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: 'Potomac Dr, Houston, Texas, 77057',
      slug: 'potomac',
      address: 'Houston, Texas, 77057',
      price: '$1,375,000 - $1,970,000',
      status: 'for_sale',
      featured: true,
      isGroupParent: true,
      description: "Welcome to Potomac Community, a premium selection of custom residences offering modern luxury and exceptional custom design features in one of Houston's finest districts.",
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      brokerInformation: {
        brokerName: 'Jonathan Rosen',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
    } as any
  })
  console.log('Created parent community: Potomac')

  const woodlandParent = await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: 'Woodland Ave, Houston, Texas, 77009',
      slug: 'woodland',
      address: 'Houston, Texas, 77009',
      price: '$2,300,000 - $2,850,000',
      status: 'for_sale',
      featured: false,
      isGroupParent: true,
      description: "Welcome to Woodland Ave Community, featuring modern luxury townhomes and customized interior features in the heart of Houston's Woodland Heights.",
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      brokerInformation: {
        brokerName: 'Jonathan Rosen',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
    } as any
  })
  console.log('Created parent community: Woodland')

  // 3. Create Child Units for Potomac (6 units)
  for (let i = 1; i <= 6; i++) {
    const isSold = i > 4
    const isUnderContract = i === 3 || i === 4
    const status = isSold ? 'sold' : isUnderContract ? 'under_contract' : 'for_sale'
    const priceVal = 1375000 + (i - 1) * 120000

    await payload.create({
      collection: 'properties',
      context: { disableRevalidate: true },
      data: {
        name: `Potomac Dr - Unit ${i}`,
        slug: `potomac-unit-${i}`,
        address: `Houston, Texas, 77057`,
        price: `$${priceVal.toLocaleString()}`,
        status: status,
        parentProperty: potomacParent.id,
        bannerImages: sampleMediaId ? [sampleMediaId] : [],
        propertySummary: {
          numberOfBeds: '4',
          numberOfBaths: '5',
          acArea: '4,500 - 5,500',
          designTheme: 'Modern Mediterranean',
        },
        brokerInformation: {
          brokerName: 'Jonathan Rosen',
          companyName: 'COMPASS',
          brokerImage: sampleMediaId || undefined,
        },
        builderName: 'Gilbert Homes',
        architectName: 'Clay Nelson',
        interiorDesignName: 'Kevin Spearman',
        description: `Stunning Potomac community custom unit ${i}. Featuring 4 beds, 5 baths, and open floor plans designed with exceptional craftsmanship.`,
        featuresAndAmenities: {
          propertyDetails: {
            propertyType: 'Townhome',
            yearBuilt: '2026',
            totalInteriorLivableArea: '5,000 Sq Ft',
            lotSize: '3,000 Sq Ft',
          },
          bedsAndBaths: {
            beds: '4 Beds',
            baths: '5 Baths',
            numberOfFloors: '3',
          },
          interiorFeatures: {
            firstFloor: 'Chef kitchen, living lounge room, outdoor courtyard access.',
            secondFloor: 'Spacious primary suite, 2 guest suites, and laundry room.',
          },
        }
      } as any
    })
    console.log(`Created Potomac Unit ${i}`)
  }

  // 4. Create Child Units for Woodland (2 units)
  for (let i = 1; i <= 2; i++) {
    const isUnderContract = i === 2
    const status = isUnderContract ? 'under_contract' : 'for_sale'
    const priceVal = i === 1 ? 2300000 : 2550000

    await payload.create({
      collection: 'properties',
      context: { disableRevalidate: true },
      data: {
        name: `Woodland Ave - Unit ${i}`,
        slug: `woodland-unit-${i}`,
        address: `Houston, Texas, 77009`,
        price: `$${priceVal.toLocaleString()}`,
        status: status,
        parentProperty: woodlandParent.id,
        bannerImages: sampleMediaId ? [sampleMediaId] : [],
        propertySummary: {
          numberOfBeds: '3',
          numberOfBaths: '3.5',
          acArea: '3,200',
          designTheme: 'Contemporary Modern',
        },
        brokerInformation: {
          brokerName: 'Oliver Carter',
          companyName: 'COMPASS',
          brokerImage: sampleMediaId || undefined,
        },
        builderName: 'Gilbert Homes',
        architectName: 'Clay Nelson',
        interiorDesignName: 'Lisa Roberts',
        description: `Beautiful Woodland Heights luxury unit ${i}. Featuring a contemporary layout with premium custom siding, rooftop deck, and green yard space.`,
        featuresAndAmenities: {
          propertyDetails: {
            propertyType: 'Townhome',
            yearBuilt: '2026',
            totalInteriorLivableArea: '3,200 Sq Ft',
            lotSize: '2,500 Sq Ft',
          },
          bedsAndBaths: {
            beds: '3 Beds',
            baths: '3.5 Baths',
            numberOfFloors: '3',
          },
          interiorFeatures: {
            firstFloor: 'Open concept living area and executive modern kitchen.',
            secondFloor: 'Master bedroom suite and private study.',
          },
        }
      } as any
    })
    console.log(`Created Woodland Unit ${i}`)
  }

  // 5. Create Stand-alone properties (Amherst, Heatherglen, Pine Chase, 1001 E)
  await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: '3224 Amherst Ave, Dallas, TX 75225',
      slug: '3224-amherst-avenue-dallas-tx-75225',
      address: 'Dallas, Texas, 75225',
      price: '$4,894,000',
      description: "Welcome to our luxury single-family home, located in one of Texas' finest neighborhoods. This stunning residence features spacious bedrooms, perfect for modern living. Curated by Kevin Spearman, built by Gilbert Homes.",
      status: 'for_sale',
      featured: true,
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      propertySummary: {
        numberOfBeds: '5',
        numberOfBaths: '7',
        acArea: '5,897',
        designTheme: 'Transitional Cottage',
      },
      brokerInformation: {
        brokerName: 'Jonathan Rosen',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
      builderName: 'Gilbert Homes',
      architectName: 'Clay Nelson',
      interiorDesignName: 'Kevin Spearman',
      featuresAndAmenities: {
        propertyDetails: {
          propertyType: 'Single Family Residential',
          yearBuilt: '2026',
          totalInteriorLivableArea: '5,897 Sq Ft',
          lotSize: '7,013.16 Sq Ft',
        },
        bedsAndBaths: {
          beds: '5 Beds',
          baths: '5 Full, 2 Half Baths',
          numberOfFloors: '2',
        },
        interiorFeatures: {
          firstFloor: 'Great room, formal dining room, chef kitchen, prep kitchen, pocket study, mudroom, laundry room, master bedroom suite, and outdoor living area.',
          secondFloor: '4 ensuite bedrooms, spacious game room, media room, and dedicated craft room.',
        },
      }
    } as any
  })
  console.log('Created Amherst Property')

  await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: '4927 Heatherglen Drive, Houston, Texas, 77096',
      slug: '4927-heatherglen-drive-houston-texas-77096',
      address: 'Houston, Texas, 77096',
      price: '$4,200,000',
      status: 'for_sale',
      featured: true,
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      propertySummary: {
        numberOfBeds: '5',
        numberOfBaths: '7',
        acArea: '5,897',
        designTheme: 'Contemporary Estate',
      },
      brokerInformation: {
        brokerName: 'Jonathan Rosen',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
      builderName: 'Gilbert Homes',
      architectName: 'Clay Nelson',
      interiorDesignName: 'Kevin Spearman',
      featuresAndAmenities: {
        propertyDetails: {
          propertyType: 'Single Family Residential',
          yearBuilt: '2026',
          totalInteriorLivableArea: '5,897 Sq Ft',
          lotSize: '7,013.16 Sq Ft',
        },
        bedsAndBaths: {
          beds: '5 Beds',
          baths: '7 Baths',
          numberOfFloors: '2',
        },
      }
    } as any
  })
  console.log('Created Heatherglen Property')

  await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: '1311 Pine Chase Drive, Houston, TX 77055',
      slug: '1311-pine-chase-dr-houston',
      address: 'Houston, TX, 77055',
      price: '$3,500,000',
      status: 'sold',
      featured: false,
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      propertySummary: {
        numberOfBeds: '6',
        numberOfBaths: '9',
        acArea: '6,811',
        designTheme: 'Modern Luxury',
      },
      brokerInformation: {
        brokerName: 'Oliver Carter',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
      builderName: 'GEIS Development',
      architectName: 'Clay Nelson',
      interiorDesignName: 'Lisa Roberts',
    } as any
  })
  console.log('Created Pine Chase Property')

  await payload.create({
    collection: 'properties',
    context: { disableRevalidate: true },
    data: {
      name: '1001 E, Houston, TX 77002',
      slug: '1001-e-houston-tx-77002',
      address: 'Houston, Texas, 77002',
      price: '$2,150,000',
      status: 'for_sale',
      featured: false,
      bannerImages: sampleMediaId ? [sampleMediaId] : [],
      propertySummary: {
        numberOfBeds: '4',
        numberOfBaths: '4.5',
        acArea: '4,100',
        designTheme: 'Urban Modern',
      },
      brokerInformation: {
        brokerName: 'Jonathan Rosen',
        companyName: 'COMPASS',
        brokerImage: sampleMediaId || undefined,
      },
      builderName: 'Gilbert Homes',
      architectName: 'Clay Nelson',
      interiorDesignName: 'Kevin Spearman',
    } as any
  })
  console.log('Created 1001 E Property')

  console.log('✨ All Properties Seeded Successfully!')
  process.exit(0)
}

seedDemoProperty().catch((err) => {
  console.error('❌ Error seeding properties:', err)
  process.exit(1)
})

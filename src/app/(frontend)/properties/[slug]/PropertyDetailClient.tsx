'use client'

import React, { useState, useRef, useEffect } from 'react'
import Link from 'next/link'

interface PropertyDetailClientProps {
  property: any
  otherProperties?: any[]
  youtubeEmbedUrl: string | null
  childProperties?: any[]
}

export default function PropertyDetailClient({
  property,
  otherProperties = [],
  youtubeEmbedUrl,
  childProperties = [],
}: PropertyDetailClientProps) {
  // Accordions state
  const [openAccordions, setOpenAccordions] = useState<{ [key: string]: boolean }>({
    propertyDetails: false,
    bedsAndBaths: false,
    interiorFeatures: false,
    exteriorFeatures: false,
  })

  // Lightbox / Media Modal state
  const [activeModal, setActiveModal] = useState<'photos' | 'floorplans' | 'video' | null>(null)
  const [activePhotoTab, setActivePhotoTab] = useState<'design' | 'progress'>('design')
  const [bannerSlideIndex, setBannerSlideIndex] = useState<number>(0)
  const [activeNeighborhoodCard, setActiveNeighborhoodCard] = useState<number>(2) // Default 3rd card open (0-indexed)

  // Contact Form States (Section 6 & Sidebar)
  const [sec6State, setSec6State] = useState({
    name: '',
    phone: '',
    email: '',
    preferredContactMethod: 'Email',
    interestedIn: 'Purchasing a Property',
    message: '',
  })
  const [sec6Status, setSec6Status] = useState<'idle' | 'submitting' | 'success' | 'error'>('idle')
  const [sec6Error, setSec6Error] = useState('')

  const [sidebarState, setSidebarState] = useState({
    name: '',
    phone: '',
    email: '',
    message: '',
  })
  const [sidebarStatus, setSidebarStatus] = useState<'idle' | 'submitting' | 'success' | 'error'>('idle')
  const [sidebarError, setSidebarError] = useState('')

  const targetFormId =
    typeof property?.contactForm === 'object' && property?.contactForm?.id
      ? String(property.contactForm.id)
      : typeof property?.contactForm === 'string' || typeof property?.contactForm === 'number'
      ? String(property.contactForm)
      : '1'

  const handleSec6Submit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!sec6State.name || !sec6State.email) return

    setSec6Status('submitting')
    setSec6Error('')

    const submissionData = [
      { field: 'name', value: sec6State.name },
      { field: 'phone', value: sec6State.phone },
      { field: 'email', value: sec6State.email },
      { field: 'preferredContactMethod', value: sec6State.preferredContactMethod },
      { field: 'interestedIn', value: sec6State.interestedIn },
      { field: 'message', value: sec6State.message },
      { field: 'property', value: property?.name || property?.slug || '' },
      { field: 'pageUrl', value: typeof window !== 'undefined' ? window.location.href : '' },
    ]

    try {
      const res = await fetch('/api/form-submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          form: targetFormId,
          submissionData,
        }),
      })

      if (res.ok) {
        setSec6Status('success')
        setSec6State({
          name: '',
          phone: '',
          email: '',
          preferredContactMethod: 'Email',
          interestedIn: 'Purchasing a Property',
          message: '',
        })
      } else {
        const json = await res.json()
        setSec6Status('error')
        setSec6Error(json?.errors?.[0]?.message || 'Failed to submit form. Please try again.')
      }
    } catch (err: any) {
      setSec6Status('error')
      setSec6Error(err?.message || 'Network error. Please try again.')
    }
  }

  const handleSidebarSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!sidebarState.name || !sidebarState.email) return

    setSidebarStatus('submitting')
    setSidebarError('')

    const submissionData = [
      { field: 'name', value: sidebarState.name },
      { field: 'phone', value: sidebarState.phone },
      { field: 'email', value: sidebarState.email },
      { field: 'message', value: sidebarState.message },
      { field: 'property', value: property?.name || property?.slug || '' },
      { field: 'pageUrl', value: typeof window !== 'undefined' ? window.location.href : '' },
    ]

    try {
      const res = await fetch('/api/form-submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          form: targetFormId,
          submissionData,
        }),
      })

      if (res.ok) {
        setSidebarStatus('success')
        setSidebarState({
          name: '',
          phone: '',
          email: '',
          message: '',
        })
      } else {
        const json = await res.json()
        setSidebarStatus('error')
        setSidebarError(json?.errors?.[0]?.message || 'Failed to submit inquiry. Please try again.')
      }
    } catch (err: any) {
      setSidebarStatus('error')
      setSidebarError(err?.message || 'Network error. Please try again.')
    }
  }

  // Prevent background scrolling when any modal is open
  useEffect(() => {
    if (activeModal) {
      document.body.style.overflow = 'hidden'
    } else {
      document.body.style.overflow = ''
    }
    return () => {
      document.body.style.overflow = ''
    }
  }, [activeModal])

  // Swiper Slider Ref
  const sliderRef = useRef<HTMLDivElement>(null)

  const toggleAccordion = (key: string) => {
    setOpenAccordions((prev) => ({
      ...prev,
      [key]: !prev[key],
    }))
  }

  const slideLeft = () => {
    if (sliderRef.current) {
      sliderRef.current.scrollBy({ left: -500, behavior: 'smooth' })
    }
  }

  const slideRight = () => {
    if (sliderRef.current) {
      sliderRef.current.scrollBy({ left: 500, behavior: 'smooth' })
    }
  }

  const intFeat = property.featuresAndAmenities?.interiorFeatures || {}
  const extFeat = property.featuresAndAmenities?.exteriorFeatures || {}
  const status = property.status || 'for_sale'

  // Community Slider Ref
  const communitySliderRef = useRef<HTMLDivElement>(null)

  const scrollCommunityLeft = () => {
    if (communitySliderRef.current) {
      communitySliderRef.current.scrollBy({ left: -320, behavior: 'smooth' })
    }
  }

  const scrollCommunityRight = () => {
    if (communitySliderRef.current) {
      communitySliderRef.current.scrollBy({ left: 320, behavior: 'smooth' })
    }
  }

  const getValidImageUrl = (img: any): string => {
    if (!img) return ''
    if (typeof img === 'string') {
      if (img.startsWith('/') || img.startsWith('http') || img.includes('.')) return img
      return ''
    }
    if (typeof img === 'object') {
      if (img.url && typeof img.url === 'string') return img.url
      if (img.filename && typeof img.filename === 'string') return `/media/${img.filename}`
      if (img.image) return getValidImageUrl(img.image)
    }
    return ''
  }

  const rawBase = property.name?.split(',')[0] || ''
  const isWoodland = property.slug === 'woodland'
  const isPotomac = property.slug === 'potomac' || property.slug === 'the-potomac'
  const isParentCommunity = property.isGroupParent || isWoodland || isPotomac
  const cleanBase = rawBase.replace(/Dr|Ave|Road|Street|Lane/gi, '').trim()

  // Dynamic modal backgrounds
  const photosCoverUrl =
    (property.allPhotos &&
      property.allPhotos.length > 0 &&
      getValidImageUrl(property.allPhotos[0])) ||
    '/media/1001Efront.webp'

  const floorplanCoverUrl =
    (property.floorPlans &&
      property.floorPlans.length > 0 &&
      getValidImageUrl(property.floorPlans[0]?.image)) ||
    (property.allFloorPlanPhotos &&
      property.allFloorPlanPhotos.length > 0 &&
      getValidImageUrl(property.allFloorPlanPhotos[0])) ||
    '/media/034.webp'

  const videoCoverUrl =
    (property.bannerImages &&
      property.bannerImages.length > 0 &&
      getValidImageUrl(property.bannerImages[0])) ||
    '/media/3dtour.webp'

  // Dynamic media availability flags
  const hasFloorplans = Boolean(
    (property.floorPlans && property.floorPlans.length > 0) ||
      (property.allFloorPlanPhotos && property.allFloorPlanPhotos.length > 0),
  )
  const hasVideo = Boolean(youtubeEmbedUrl || property.youtubeVideoUrl)

  // Filter out any child unit properties (only display individual standalone properties)
  const standaloneProps = otherProperties.filter((p: any) => !p.parentProperty)

  // Fallback default properties if none passed
  const listOtherProps =
    standaloneProps.length > 0
      ? standaloneProps
      : [
          {
            id: '1',
            name: 'Potomac Dr, Houston, TX, 77057',
            slug: 'potomac-dr-houston-tx-77057',
            status: 'under_contract',
            bannerImages: [
              {
                url: 'https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp',
              },
            ],
            propertySummary: { numberOfBeds: '4', numberOfBaths: '5', acArea: '4,500 - 5,500' },
          },
          {
            id: '2',
            name: '4927 Heatherglen Drive, Houston, Texas, 77096',
            slug: '4927-heatherglen-drive-houston-texas-77096',
            status: 'for_sale',
            bannerImages: [
              {
                url: 'https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp',
              },
            ],
            propertySummary: { numberOfBeds: '5', numberOfBaths: '7', acArea: '5,897' },
          },
          {
            id: '3',
            name: '1311 Pine Chase Drive, Houston, TX 77055',
            slug: '1311-pine-chase-dr-houston',
            status: 'sold',
            bannerImages: [
              {
                url: 'https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp',
              },
            ],
            propertySummary: { numberOfBeds: '6', numberOfBaths: '9', acArea: '6,811' },
          },
        ]

  return (
    <div
      style={{
        backgroundColor: '#ffffff',
        color: '#1a1a1a',
        minHeight: '100vh',
        fontFamily: "'Montserrat', sans-serif",
        overflowX: 'hidden',
        width: '100%',
      }}
    >
      {/* Import Google Fonts */}
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
      <link
        href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Montserrat:wght@300;400;500;600;700&display=swap"
        rel="stylesheet"
      />

      <style
        dangerouslySetInnerHTML={{
          __html: `
        .no-scrollbar::-webkit-scrollbar {
          display: none;
        }
        .no-scrollbar {
          -ms-overflow-style: none;
          scrollbar-width: none;
        }
      `,
        }}
      />

      {/* Breadcrumb Navigation */}
      <div
        style={{
          maxWidth: '1440px',
          margin: '0 auto',
          padding: 'clamp(6rem, 10vh, 7rem) 1.5rem 0.5rem',
        }}
      >
        <div
          style={{
            display: 'flex',
            gap: '0.5rem',
            alignItems: 'center',
            fontSize: '0.85rem',
            color: '#737373',
          }}
        >
          <Link href="/" style={{ color: '#737373', textDecoration: 'none' }}>
            Home
          </Link>
          <span>›</span>
          <Link href="/properties" style={{ color: '#737373', textDecoration: 'none' }}>
            Properties
          </Link>
          <span>›</span>
          <span style={{ color: '#1a1a1a', fontWeight: '600' }}>
            {property.name?.split(',')[0] || 'Property Details'}
          </span>
        </div>
      </div>

      {isParentCommunity ? (
        isPotomac ? (
          <div>
            {/* Potomac Section 1: Hero Banner Carousel Slider */}
            <section
              style={{
                maxWidth: '1440px',
                margin: '1.5rem auto 1rem',
                padding: '0 1.5rem',
                position: 'relative',
              }}
            >
              <div
                style={{
                  position: 'relative',
                  width: '100%',
                  height: 'clamp(380px, 56vh, 620px)',
                  backgroundColor: '#1f1f1f',
                  borderRadius: '4px',
                  overflow: 'hidden',
                  boxShadow: '0 10px 30px rgba(0,0,0,0.12)',
                }}
              >
                {(() => {
                  const potomacImagesList = [
                    '/media/SmallB-Exterior.00051-ezgif.com-png-to-webp-converter-scaled.webp',
                    '/media/Potomac_Exterior_Updated.webp',
                    '/media/Potomac-1.webp',
                    '/media/Potomac-1-6.webp',
                    '/media/potomac-2-exterior-render-1.webp',
                  ]
                  const propertyUrls = (property.bannerImages || [])
                    .map(getValidImageUrl)
                    .filter(Boolean)
                  const finalImages = propertyUrls.length > 0 ? propertyUrls : potomacImagesList
                  const activeImage = finalImages[bannerSlideIndex % finalImages.length]

                  const prevSlide = () => {
                    setBannerSlideIndex((prev) => (prev === 0 ? finalImages.length - 1 : prev - 1))
                  }
                  const nextSlide = () => {
                    setBannerSlideIndex((prev) => (prev === finalImages.length - 1 ? 0 : prev + 1))
                  }

                  return (
                    <>
                      <img
                        src={activeImage}
                        alt="The Potomac Banner"
                        style={{
                          width: '100%',
                          height: '100%',
                          objectFit: 'cover',
                          display: 'block',
                          transition: 'opacity 0.4s ease-in-out',
                        }}
                      />
                      {/* Left Arrow */}
                      <button
                        type="button"
                        onClick={prevSlide}
                        style={{
                          position: 'absolute',
                          left: '20px',
                          top: '50%',
                          transform: 'translateY(-50%)',
                          width: '44px',
                          height: '44px',
                          borderRadius: '50%',
                          backgroundColor: 'rgba(0,0,0,0.4)',
                          color: '#ffffff',
                          border: 'none',
                          fontSize: '24px',
                          cursor: 'pointer',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          backdropFilter: 'blur(4px)',
                        }}
                      >
                        ‹
                      </button>
                      {/* Right Arrow */}
                      <button
                        type="button"
                        onClick={nextSlide}
                        style={{
                          position: 'absolute',
                          right: '20px',
                          top: '50%',
                          transform: 'translateY(-50%)',
                          width: '44px',
                          height: '44px',
                          borderRadius: '50%',
                          backgroundColor: 'rgba(0,0,0,0.4)',
                          color: '#ffffff',
                          border: 'none',
                          fontSize: '24px',
                          cursor: 'pointer',
                          display: 'flex',
                          alignItems: 'center',
                          justifyContent: 'center',
                          backdropFilter: 'blur(4px)',
                        }}
                      >
                        ›
                      </button>
                    </>
                  )
                })()}

                {/* Floor Plan Overlay Button */}
                <div style={{ position: 'absolute', bottom: '25px', right: '30px', zIndex: 10 }}>
                  <div
                    onClick={() => setActiveModal('floorplans')}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '12px',
                      padding: '10px 24px',
                      border: '2px solid #ffffff',
                      backgroundColor: 'rgba(255, 255, 255, 0.2)',
                      backdropFilter: 'blur(6px)',
                      color: '#ffffff',
                      cursor: 'pointer',
                      boxShadow: '0px 2px 10px rgba(0,0,0,0.4)',
                    }}
                  >
                    <img src="/media/blueprint-1-4.png" alt="Floor Plan" width="28" height="28" />
                    <div>
                      <div style={{ fontWeight: '600', fontSize: '15px', lineHeight: '1.2' }}>
                        Floor Plan
                      </div>
                      <div style={{ fontSize: '11px', opacity: 0.9 }}>Explore the Layout</div>
                    </div>
                  </div>
                </div>
              </div>

              {/* Disclaimer Line */}
              <div
                style={{
                  textAlign: 'center',
                  marginTop: '1rem',
                  fontSize: '12px',
                  color: '#666666',
                  fontStyle: 'italic',
                }}
              >
                <strong>Disclaimer :</strong> These images are rendered visuals of the property that is
                currently under construction. Images © Novel Signature Homes.
              </div>
            </section>

            {/* Potomac Section 2: Title & 2-Column Showcase (Video Left + Full Description Paragraph Right) */}
            <section
              style={{
                maxWidth: '1440px',
                margin: '3rem auto',
                padding: '0 1.5rem',
              }}
            >
              <h1
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '52px',
                  fontWeight: '400',
                  color: '#1a1a1a',
                  textAlign: 'center',
                  margin: '0 0 1.5rem',
                }}
              >
                The Potomac
              </h1>
              <hr
                style={{
                  border: 0,
                  borderTop: '1px solid #e8e1d6',
                  margin: '0 0 3rem',
                }}
              />

              <div
                style={{
                  display: 'grid',
                  gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))',
                  gap: '3.5rem',
                  alignItems: 'center',
                }}
              >
                {/* Left Column: 16:9 YouTube Video Embed */}
                <div
                  style={{
                    position: 'relative',
                    width: '100%',
                    aspectRatio: '16/9',
                    overflow: 'hidden',
                    borderRadius: '4px',
                    boxShadow: '0 8px 25px rgba(0,0,0,0.1)',
                  }}
                >
                  <iframe
                    src={
                      youtubeEmbedUrl ||
                      'https://www.youtube.com/embed/iDv2I89i8QY?list=PLIOenYiAgtKRgzRAbfs-glHFnXTYkJWpG&rel=0'
                    }
                    title="A New Standard in Houston Luxury Living | The Potomac by Novel Signature Homes"
                    style={{ width: '100%', height: '100%', border: 'none' }}
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                  />
                </div>

                {/* Right Column: Detailed Description Paragraph */}
                <div>
                  <p
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '15px',
                      lineHeight: '1.85',
                      color: '#525252',
                      margin: 0,
                    }}
                  >
                    {property.description ||
                      "This exclusive collection of luxury homes offers an unparalleled living experience in one of the city's most coveted areas. It enjoys proximity to prestigious schools like T.H. Rogers and Kinkaid, making it ideal for families. With Briarbend Park nearby and easy access to numerous retail centers, this home combines convenience with elegance. Designed by the renowned Kevin Spearman, the interiors exude sophistication, blending modern aesthetics with timeless charm. With excellent public transport access and a prime location, this home represents the height of luxury living in Houston."}
                  </p>
                </div>
              </div>
            </section>

            {/* Potomac Section 3: Project Team & Partners Bar */}
            <section
              style={{
                backgroundColor: '#1c1c1c',
                color: '#ffffff',
                padding: '2.5rem 1.5rem',
                margin: '4rem 0',
              }}
            >
              <div
                style={{
                  maxWidth: '1280px',
                  margin: '0 auto',
                  display: 'grid',
                  gridTemplateColumns: 'repeat(3, 1fr)',
                  gap: '2rem',
                  textAlign: 'center',
                }}
              >
                <div>
                  <div
                    style={{
                      fontSize: '11px',
                      color: '#dfcbb5',
                      textTransform: 'uppercase',
                      letterSpacing: '2px',
                      marginBottom: '0.4rem',
                    }}
                  >
                    BROKER
                  </div>
                  <div
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '24px',
                      fontWeight: '500',
                    }}
                  >
                    {property.projectTeam?.brokerName || 'Casey Charles'}
                  </div>
                </div>
                <div>
                  <div
                    style={{
                      fontSize: '11px',
                      color: '#dfcbb5',
                      textTransform: 'uppercase',
                      letterSpacing: '2px',
                      marginBottom: '0.4rem',
                    }}
                  >
                    BUILDER
                  </div>
                  <div
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '24px',
                      fontWeight: '500',
                    }}
                  >
                    {property.projectTeam?.builderName || 'Gifford Construction'}
                  </div>
                </div>
                <div>
                  <div
                    style={{
                      fontSize: '11px',
                      color: '#dfcbb5',
                      textTransform: 'uppercase',
                      letterSpacing: '2px',
                      marginBottom: '0.4rem',
                    }}
                  >
                    INTERIOR DESIGNER
                  </div>
                  <div
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '24px',
                      fontWeight: '500',
                    }}
                  >
                    {property.projectTeam?.interiorDesignerName || 'Kevin Spearman'}
                  </div>
                </div>
              </div>
            </section>

            {/* Potomac Section 4: The Potomac Collection (Infinite Smooth Auto-Slider, 3 Cards Per View) */}
            <section style={{ maxWidth: '1440px', margin: '4rem auto', padding: '0 1.5rem', overflow: 'hidden' }}>
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '42px',
                  fontWeight: '400',
                  color: '#1a1a1a',
                  margin: '0',
                }}
              >
                The <span style={{ color: '#8A561F' }}>Potomac</span> collection
              </h2>
              <hr style={{ border: 0, borderTop: '1px solid #e8e1d6', margin: '1.5rem 0 2.5rem' }} />

              <div style={{ position: 'relative', width: '100%', overflow: 'hidden' }}>
                <div className="potomac-infinite-track">
                  {(() => {
                    const rawUnits =
                      childProperties.length > 0
                        ? childProperties
                        : [
                            {
                              name: 'The Potomac 1',
                              slug: 'the-potomac-1',
                              status: 'under_contract',
                              beds: '4',
                              baths: '6',
                              ac: '5,412',
                              img: '/media/potomac1TLA.webp',
                            },
                            {
                              name: 'The Potomac 2',
                              slug: 'the-potomac-2',
                              status: 'for_sale',
                              beds: '4',
                              baths: '7',
                              ac: '4,592',
                              img: '/media/1.Potomac2-5card.webp',
                            },
                            {
                              name: 'The Potomac 3',
                              slug: 'the-potomac-3',
                              status: 'for_sale',
                              beds: '4',
                              baths: '7',
                              ac: '4,592',
                              img: '/media/2.Potomac2-5.webp',
                            },
                            {
                              name: 'The Potomac 4',
                              slug: 'the-potomac-4',
                              status: 'for_sale',
                              beds: '4',
                              baths: '7',
                              ac: '4,592',
                              img: '/media/1.Potomac2-5card.webp',
                            },
                            {
                              name: 'The Potomac 5',
                              slug: 'the-potomac-5',
                              status: 'for_sale',
                              beds: '4',
                              baths: '7',
                              ac: '4,592',
                              img: '/media/2.Potomac2-5.webp',
                            },
                            {
                              name: 'The Potomac 6',
                              slug: 'the-potomac-6',
                              status: 'for_sale',
                              beds: '4',
                              baths: '6',
                              ac: '5,412',
                              img: '/media/2.Potomac16frontlow.webp',
                            },
                          ]

                    // Duplicate array to enable seamless infinite scroll loop
                    const duplicatedUnits = [...rawUnits, ...rawUnits]

                    return duplicatedUnits.map((unit: any, idx: number) => {
                      const isUnderContract = unit.status === 'under_contract'
                      const statusText = isUnderContract ? 'UNDER CONTRACT' : 'FOR SALE'
                      const statusBg = isUnderContract ? '#8A561F' : '#1e3a8a'
                      const imgUrl =
                        getValidImageUrl(unit.bannerImages?.[0]) ||
                        unit.img ||
                        '/media/Potomac_Exterior_Updated.webp'

                      return (
                        <Link
                          key={`${unit.id || unit.slug}-${idx}`}
                          href={`/properties/${unit.slug}`}
                          style={{
                            width: 'clamp(300px, 31vw, 420px)',
                            flex: '0 0 clamp(300px, 31vw, 420px)',
                            border: '1px solid #e8e1d6',
                            backgroundColor: '#ffffff',
                            borderRadius: '4px',
                            overflow: 'hidden',
                            display: 'flex',
                            flexDirection: 'column',
                            textDecoration: 'none',
                            color: 'inherit',
                            cursor: 'pointer',
                            transition: 'transform 0.3s ease, box-shadow 0.3s ease',
                          }}
                        >
                          <div style={{ position: 'relative', height: '240px', overflow: 'hidden' }}>
                            <img
                              src={imgUrl}
                              alt={unit.name}
                              style={{ width: '100%', height: '100%', objectFit: 'cover' }}
                            />
                            <div
                              style={{
                                position: 'absolute',
                                top: '12px',
                                right: '12px',
                                backgroundColor: statusBg,
                                color: '#ffffff',
                                fontSize: '10px',
                                fontWeight: '700',
                                letterSpacing: '1px',
                                padding: '4px 10px',
                                borderRadius: '2px',
                                textTransform: 'uppercase',
                              }}
                            >
                              {statusText}
                            </div>
                          </div>
                          <div
                            style={{
                              padding: '1.5rem',
                              flexGrow: 1,
                              display: 'flex',
                              flexDirection: 'column',
                              justifyContent: 'space-between',
                            }}
                          >
                            <div>
                              <h3
                                style={{
                                  fontFamily: "'Cormorant Garamond', serif",
                                  fontSize: '26px',
                                  fontWeight: '500',
                                  color: '#1a1a1a',
                                  margin: '0 0 0.5rem',
                                }}
                              >
                                {unit.name}
                              </h3>
                              <div
                                style={{
                                  fontSize: '13px',
                                  color: '#666666',
                                  marginBottom: '1.25rem',
                                }}
                              >
                                {unit.propertySummary?.numberOfBeds || unit.beds || '4'} BD |{' '}
                                {unit.propertySummary?.numberOfBaths || unit.baths || '6'} BA | AC Area :{' '}
                                {unit.propertySummary?.acArea || unit.ac || '5,412'}
                              </div>
                            </div>
                            <div>
                              <span
                                style={{
                                  display: 'inline-flex',
                                  alignItems: 'center',
                                  gap: '6px',
                                  color: '#8A561F',
                                  fontSize: '13px',
                                  fontWeight: '600',
                                  letterSpacing: '0.5px',
                                }}
                              >
                                View Property »
                              </span>
                            </div>
                          </div>
                        </Link>
                      )
                    })
                  })()}
                </div>
              </div>
            </section>

            {/* Potomac Section 5: Experience Your Future Home (All Photos & All Floor Plans Only) */}
            <section
              style={{
                backgroundColor: '#ffffff',
                padding: '4rem 1.5rem',
                borderTop: '1px solid #e8e1d6',
                borderBottom: '1px solid #e8e1d6',
              }}
            >
              <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
                <h2
                  style={{
                    fontFamily: "'Cormorant Garamond', serif",
                    fontSize: '42px',
                    fontWeight: '400',
                    color: '#1a1a1a',
                    margin: '0 0 1.5rem',
                  }}
                >
                  Experience Your <span style={{ color: '#8A561F' }}>Future Home</span>
                </h2>
                <hr
                  style={{ border: 0, borderTop: '1px solid #e8e1d6', margin: '0 0 2.5rem' }}
                />

                <div
                  style={{
                    display: 'grid',
                    gridTemplateColumns: 'repeat(3, 1fr)',
                    gap: '1.5rem',
                  }}
                >
                  {/* Card 1: All Photos (33.33% width) */}
                  <div
                    onClick={() => setActiveModal('photos')}
                    style={{
                      position: 'relative',
                      height: '220px',
                      backgroundColor: '#262626',
                      cursor: 'pointer',
                      overflow: 'hidden',
                      borderRadius: '4px',
                    }}
                  >
                    <img
                      src="/media/Potomac_Exterior_Updated.webp"
                      alt="All Photos"
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover',
                        opacity: 0.8,
                      }}
                    />
                    <div
                      style={{
                        position: 'absolute',
                        inset: 0,
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                      }}
                    >
                      <div
                        style={{
                          padding: '8px 20px',
                          border: '1px solid #ffffff',
                          color: '#ffffff',
                          backgroundColor: 'rgba(0,0,0,0.4)',
                          fontSize: '14px',
                          fontWeight: '500',
                          letterSpacing: '0.5px',
                        }}
                      >
                        All Photos
                      </div>
                    </div>
                  </div>

                  {/* Card 2: All Floor Plans (33.33% width) */}
                  <div
                    onClick={() => setActiveModal('floorplans')}
                    style={{
                      position: 'relative',
                      height: '220px',
                      backgroundColor: '#171717',
                      cursor: 'pointer',
                      overflow: 'hidden',
                      borderRadius: '4px',
                    }}
                  >
                    <img
                      src="/media/potomac25floorplan.webp"
                      alt="All Floor Plans"
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover',
                        opacity: 0.5,
                        filter: 'grayscale(100%)',
                      }}
                    />
                    <div
                      style={{
                        position: 'absolute',
                        inset: 0,
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                      }}
                    >
                      <div
                        style={{
                          padding: '8px 20px',
                          border: '1px solid #ffffff',
                          color: '#ffffff',
                          backgroundColor: 'rgba(0,0,0,0.4)',
                          fontSize: '14px',
                          fontWeight: '500',
                          letterSpacing: '0.5px',
                        }}
                      >
                        All Floor Plans
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>

            {/* Potomac Section 6: Contact Form (Matching Image 2 100% with top gold border line, 2-column layout, and woodgrain background) */}
            <section
              style={{
                backgroundImage: "url('/media/whitebg-1.webp')",
                backgroundColor: '#fbfaf8',
                backgroundSize: 'cover',
                backgroundPosition: 'center',
                borderTop: '1px solid #8A561F',
                padding: '5rem 1.5rem',
              }}
            >
              <div
                style={{
                  maxWidth: '1360px',
                  margin: '0 auto',
                  display: 'grid',
                  gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))',
                  gap: '4rem',
                  alignItems: 'center',
                }}
              >
                {/* Left Column: Uppercase Title */}
                <div>
                  <h2
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '44px',
                      fontWeight: '400',
                      lineHeight: '1.25',
                      color: '#1a1a1a',
                      textTransform: 'uppercase',
                      letterSpacing: '1px',
                      margin: 0,
                    }}
                  >
                    LET'S FIND YOUR <span style={{ color: '#8A561F' }}>DREAM HOME</span> TOGETHER
                  </h2>
                </div>

                {/* Right Column: Form Inputs */}
                <div>
                  {sec6Status === 'success' ? (
                    <div style={{ backgroundColor: '#f0fdf4', border: '1px solid #bbf7d0', color: '#166534', padding: '2rem', borderRadius: '4px', textAlign: 'center' }}>
                      <h3 style={{ margin: '0 0 8px', fontSize: '20px', fontWeight: 600 }}>Thank You!</h3>
                      <p style={{ margin: 0, fontSize: '14px' }}>Your inquiry has been submitted successfully. Our team will contact you shortly.</p>
                    </div>
                  ) : (
                    <form
                      onSubmit={handleSec6Submit}
                      style={{ display: 'grid', gap: '1.25rem' }}
                    >
                      {sec6Status === 'error' && (
                        <div style={{ backgroundColor: '#fef2f2', border: '1px solid #fecaca', color: '#991b1b', padding: '12px 16px', borderRadius: '2px', fontSize: '13px' }}>
                          {sec6Error}
                        </div>
                      )}
                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            fontWeight: '500',
                            color: '#444444',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Name *
                        </label>
                        <input
                          type="text"
                          required
                          value={sec6State.name}
                          onChange={(e) => setSec6State({ ...sec6State, name: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '14px 18px',
                            backgroundColor: '#eeeeef',
                            border: 'none',
                            borderRadius: '2px',
                            fontSize: '14px',
                            color: '#1a1a1a',
                            outline: 'none',
                          }}
                        />
                      </div>
                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            fontWeight: '500',
                            color: '#444444',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Phone
                        </label>
                        <input
                          type="tel"
                          value={sec6State.phone}
                          onChange={(e) => setSec6State({ ...sec6State, phone: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '14px 18px',
                            backgroundColor: '#eeeeef',
                            border: 'none',
                            borderRadius: '2px',
                            fontSize: '14px',
                            color: '#1a1a1a',
                            outline: 'none',
                          }}
                        />
                      </div>
                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            fontWeight: '500',
                            color: '#444444',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Email *
                        </label>
                        <input
                          type="email"
                          required
                          value={sec6State.email}
                          onChange={(e) => setSec6State({ ...sec6State, email: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '14px 18px',
                            backgroundColor: '#eeeeef',
                            border: 'none',
                            borderRadius: '2px',
                            fontSize: '14px',
                            color: '#1a1a1a',
                            outline: 'none',
                          }}
                        />
                      </div>
                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            fontWeight: '500',
                            color: '#444444',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Message
                        </label>
                        <textarea
                          rows={4}
                          value={sec6State.message}
                          onChange={(e) => setSec6State({ ...sec6State, message: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '14px 18px',
                            backgroundColor: '#eeeeef',
                            border: 'none',
                            borderRadius: '2px',
                            fontSize: '14px',
                            color: '#1a1a1a',
                            outline: 'none',
                            resize: 'vertical',
                          }}
                        />
                      </div>
                      <div style={{ textAlign: 'left', marginTop: '0.5rem' }}>
                        <button
                          type="submit"
                          disabled={sec6Status === 'submitting'}
                          style={{
                            padding: '14px 42px',
                            backgroundColor: '#000000',
                            color: '#ffffff',
                            border: 'none',
                            borderRadius: '2px',
                            fontSize: '13px',
                            fontWeight: '600',
                            letterSpacing: '1px',
                            cursor: sec6Status === 'submitting' ? 'not-allowed' : 'pointer',
                            opacity: sec6Status === 'submitting' ? 0.7 : 1,
                            textTransform: 'uppercase',
                          }}
                        >
                          {sec6Status === 'submitting' ? 'Submitting...' : 'Submit'}
                        </button>
                      </div>
                    </form>
                  )}
                </div>
              </div>
            </section>
          </div>
        ) : (
          <div>
            {/* Section 1: Banner Carousel Slider */}
          <section
            className="woodland-banner"
            style={{
              maxWidth: '1440px',
              margin: '1.5rem auto 3rem',
              padding: '0 1.5rem',
              position: 'relative',
            }}
          >
            <div
              style={{
                position: 'relative',
                width: '100%',
                height: 'clamp(380px, 56vh, 620px)',
                backgroundColor: '#1f1f1f',
                borderRadius: '4px',
                overflow: 'hidden',
                boxShadow: '0 10px 30px rgba(0,0,0,0.12)',
              }}
            >
              {(() => {
                const bannerImagesList = [
                  '/media/gal-img-1.webp',
                  '/media/gal-img-2.webp',
                  '/media/gal-img-3.webp',
                  '/media/gal-img-4.webp',
                  '/media/2436-WhiteOak-Render-1-1024x573.webp',
                  '/media/2434-WhiteOak-Render-1-1024x573.webp',
                ]
                const propertyUrls = (property.bannerImages || [])
                  .map(getValidImageUrl)
                  .filter(Boolean)
                const finalImages = propertyUrls.length > 0 ? propertyUrls : bannerImagesList
                const activeImage = finalImages[bannerSlideIndex % finalImages.length]

                const prevSlide = () => {
                  setBannerSlideIndex((prev) => (prev === 0 ? finalImages.length - 1 : prev - 1))
                }
                const nextSlide = () => {
                  setBannerSlideIndex((prev) => (prev === finalImages.length - 1 ? 0 : prev + 1))
                }

                return (
                  <>
                    <img
                      src={activeImage}
                      alt={`${property.name || 'Woodland Heights'} Banner ${bannerSlideIndex + 1}`}
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover',
                        display: 'block',
                        transition: 'opacity 0.4s ease-in-out',
                      }}
                    />

                    {/* Navigation Arrow Left */}
                    <button
                      type="button"
                      onClick={prevSlide}
                      aria-label="Previous Slide"
                      style={{
                        position: 'absolute',
                        left: '20px',
                        top: '50%',
                        transform: 'translateY(-50%)',
                        width: '44px',
                        height: '44px',
                        borderRadius: '50%',
                        backgroundColor: 'rgba(0, 0, 0, 0.45)',
                        color: '#ffffff',
                        border: '1px solid rgba(255, 255, 255, 0.3)',
                        backdropFilter: 'blur(4px)',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        fontSize: '20px',
                        zIndex: 10,
                        transition: 'background-color 0.2s',
                      }}
                      onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0.75)')}
                      onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0.45)')}
                    >
                      ‹
                    </button>

                    {/* Navigation Arrow Right */}
                    <button
                      type="button"
                      onClick={nextSlide}
                      aria-label="Next Slide"
                      style={{
                        position: 'absolute',
                        right: '20px',
                        top: '50%',
                        transform: 'translateY(-50%)',
                        width: '44px',
                        height: '44px',
                        borderRadius: '50%',
                        backgroundColor: 'rgba(0, 0, 0, 0.45)',
                        color: '#ffffff',
                        border: '1px solid rgba(255, 255, 255, 0.3)',
                        backdropFilter: 'blur(4px)',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        fontSize: '20px',
                        zIndex: 10,
                        transition: 'background-color 0.2s',
                      }}
                      onMouseEnter={(e) => (e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0.75)')}
                      onMouseLeave={(e) => (e.currentTarget.style.backgroundColor = 'rgba(0, 0, 0, 0.45)')}
                    >
                      ›
                    </button>

                    {/* Dot Indicators */}
                    <div
                      style={{
                        position: 'absolute',
                        bottom: '20px',
                        left: '50%',
                        transform: 'translateX(-50%)',
                        display: 'flex',
                        gap: '8px',
                        zIndex: 10,
                      }}
                    >
                      {finalImages.map((_: any, idx: number) => (
                        <div
                          key={idx}
                          onClick={() => setBannerSlideIndex(idx)}
                          style={{
                            width: idx === bannerSlideIndex ? '24px' : '8px',
                            height: '8px',
                            borderRadius: '4px',
                            backgroundColor: idx === bannerSlideIndex ? '#ffffff' : 'rgba(255, 255, 255, 0.5)',
                            cursor: 'pointer',
                            transition: 'all 0.3s ease',
                          }}
                        />
                      ))}
                    </div>
                  </>
                )
              })()}
            </div>
          </section>

          {/* Main Title & Unit Addresses Section */}
          <section style={{ maxWidth: '1440px', margin: '2rem auto 1.5rem', padding: '0 1.5rem', textAlign: 'center' }}>
            <h1
              style={{
                fontFamily: "'Cormorant Garamond', serif",
                fontSize: '44px',
                fontWeight: '400',
                color: '#1a1a1a',
                margin: '0 0 1rem',
                letterSpacing: '0.5px',
              }}
            >
              {property.name?.toLowerCase().includes('woodland') ? 'Woodland Heights' : (property.name?.split(',')[0] || 'Woodland Heights')}
            </h1>
            <hr style={{ border: 'none', borderTop: '1px solid #e2e8f0', margin: '0 0 1.5rem' }} />

            {/* Sub-Unit Addresses Row */}
            <div
              style={{
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'center',
                flexWrap: 'wrap',
                gap: '1rem',
                fontSize: '13px',
                fontFamily: "'Montserrat', sans-serif",
                color: '#334155',
                marginBottom: '1.5rem',
              }}
            >
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#1a1a1a' }}>
                  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                  <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span>2436 White Oak Dr, Houston, TX, 77009</span>
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ color: '#1a1a1a' }}>
                  <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                  <polyline points="9 22 9 12 15 12 15 22"></polyline>
                </svg>
                <span>2434 White Oak Dr, Houston, TX, 77009</span>
              </div>
            </div>
          </section>

          {/* Section 2: Project Team & Partners Bar */}
          <section
            className="woodland-team"
            style={{
              maxWidth: '1440px',
              margin: '0 auto 4rem',
              padding: '0 1.5rem',
            }}
          >
            <div
              style={{
                backgroundColor: '#1a1a1a',
                color: '#ffffff',
                padding: '1.75rem 2rem',
                borderRadius: '2px',
                display: 'grid',
                gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
                gap: '1.5rem',
                boxShadow: '0 4px 20px rgba(0,0,0,0.15)',
              }}
            >
              <div style={{ textAlign: 'center' }}>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '12px',
                    color: '#a3a3a3',
                    marginBottom: '6px',
                    fontWeight: '400',
                  }}
                >
                  Broker
                </div>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '16px',
                    fontWeight: '700',
                    color: '#ffffff',
                    letterSpacing: '0.3px',
                  }}
                >
                  {property.projectTeam?.brokerName || property.brokerName || 'Ed Wolff'}
                </div>
              </div>

              <div style={{ textAlign: 'center' }}>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '12px',
                    color: '#a3a3a3',
                    marginBottom: '6px',
                    fontWeight: '400',
                  }}
                >
                  Builder
                </div>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '16px',
                    fontWeight: '700',
                    color: '#ffffff',
                    letterSpacing: '0.3px',
                  }}
                >
                  {property.projectTeam?.builderName || property.builderName || 'Novel Signature Homes'}
                </div>
              </div>

              <div style={{ textAlign: 'center' }}>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '12px',
                    color: '#a3a3a3',
                    marginBottom: '6px',
                    fontWeight: '400',
                  }}
                >
                  Architecture
                </div>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '16px',
                    fontWeight: '700',
                    color: '#ffffff',
                    letterSpacing: '0.3px',
                  }}
                >
                  {property.projectTeam?.architectName || property.architectName || 'Todd Rice'}
                </div>
              </div>

              <div style={{ textAlign: 'center' }}>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '12px',
                    color: '#a3a3a3',
                    marginBottom: '6px',
                    fontWeight: '400',
                  }}
                >
                  Interior Designer
                </div>
                <div
                  style={{
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '16px',
                    fontWeight: '700',
                    color: '#ffffff',
                    letterSpacing: '0.3px',
                  }}
                >
                  {property.projectTeam?.interiorDesignerName || property.interiorDesignName || 'Steve Clifton'}
                </div>
              </div>
            </div>
          </section>

          {/* Section 3: About Community Section */}
          <section
            className="woodland-about"
            style={{ maxWidth: '1440px', margin: '4rem auto 5rem', padding: '0 1.5rem' }}
          >
            <h2
              style={{
                fontFamily: "'Cormorant Garamond', serif",
                fontSize: '38px',
                fontWeight: '400',
                color: '#1a1a1a',
                margin: '0 0 0.5rem',
              }}
            >
              About <span style={{ color: '#8A561F' }}>{property.aboutSection?.aboutTitle || (property.name?.toLowerCase().includes('woodland') ? 'Woodland Heights' : (property.name?.split(',')[0] || 'Woodland Heights'))}</span>
            </h2>
            <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '1rem 0 2rem' }} />

            {/* Lead Intro Paragraph */}
            <p
              style={{
                fontFamily: "'Montserrat', sans-serif",
                fontSize: '14px',
                lineHeight: '1.85',
                color: '#475569',
                marginBottom: '2.5rem',
              }}
            >
              {property.aboutSection?.aboutIntro ||
                property.description ||
                `Nestled in the leafy charm of White Oaks Dr in Houston, Texas, this newly developed luxury home offers a rare blend of refined design and everyday indulgence. Thoughtfully positioned to embrace its natural surroundings, this property is a study in balance -where clean lines meet soulful warmth. Every finish is chosen with care, creating an atmosphere that feels both sophisticated and grounded. This is not just a residential house—this is a luxury retreat in Texas for those who value discretion, artisanship, and the quiet beauty of a life well lived.`}
            </p>

            {/* Aerial Background Image Banner with 3 Glassmorphism Cards */}
            <div
              style={{
                position: 'relative',
                left: '50%',
                transform: 'translateX(-50%)',
                width: '100vw',
                backgroundImage: `url(${property.aboutSection?.aboutBackgroundImage ? getValidImageUrl(property.aboutSection.aboutBackgroundImage) : '/media/gal-img-1.webp'})`,
                backgroundSize: 'cover',
                backgroundPosition: 'center',
                overflow: 'hidden',
                padding: '4.5rem 0',
                boxShadow: '0 10px 30px rgba(0,0,0,0.12)',
              }}
            >
              <div
                style={{
                  position: 'absolute',
                  inset: 0,
                  backgroundColor: 'rgba(0, 0, 0, 0.35)',
                  zIndex: 1,
                }}
              />

              <div
                style={{
                  position: 'relative',
                  zIndex: 2,
                  maxWidth: '1440px',
                  margin: '0 auto',
                  padding: '0 1.5rem',
                  display: 'grid',
                  gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))',
                  gap: '1.5rem',
                }}
              >
                {/* History Card */}
                <div
                  style={{
                    backgroundColor: 'rgba(0, 0, 0, 0.65)',
                    backdropFilter: 'blur(10px)',
                    padding: '2.5rem 2rem',
                    borderRadius: '4px',
                    color: '#ffffff',
                    border: '1px solid rgba(255, 255, 255, 0.1)',
                  }}
                >
                  <h3
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '18px',
                      fontWeight: '600',
                      color: '#ffffff',
                      margin: '0 0 1rem',
                      paddingBottom: '0.75rem',
                      borderBottom: '1px solid rgba(255, 255, 255, 0.25)',
                    }}
                  >
                    History
                  </h3>
                  <p
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      lineHeight: '1.75',
                      color: '#e2e8f0',
                      margin: 0,
                    }}
                  >
                    {property.aboutSection?.historyText ||
                      `Rooted along the banks of the White Oak Dr Bayou, this area has gracefully evolved from a 19th-century settlement into one of Houston's most established residential pockets. Blending heritage, modernity, and luxury. It is a place where tradition endures, and nature frames every moment.`}
                  </p>
                </div>

                {/* Lifestyle Card */}
                <div
                  style={{
                    backgroundColor: 'rgba(0, 0, 0, 0.65)',
                    backdropFilter: 'blur(10px)',
                    padding: '2.5rem 2rem',
                    borderRadius: '4px',
                    color: '#ffffff',
                    border: '1px solid rgba(255, 255, 255, 0.1)',
                  }}
                >
                  <h3
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '18px',
                      fontWeight: '600',
                      color: '#ffffff',
                      margin: '0 0 1rem',
                      paddingBottom: '0.75rem',
                      borderBottom: '1px solid rgba(255, 255, 255, 0.25)',
                    }}
                  >
                    Lifestyle
                  </h3>
                  <p
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      lineHeight: '1.75',
                      color: '#e2e8f0',
                      margin: 0,
                    }}
                  >
                    {property.aboutSection?.lifestyleText ||
                      `Life at White Oaks Dr unfolds with quiet elegance, generously proportioned, serene, and located for effortless connectivity. With leafy streets, nearby trails, artisan cafes and fine dining establishments, White Oak Dr offers a slower pace- ideal for those who value comfort, privacy, and convenience.`}
                  </p>
                </div>

                {/* Neighborhood Card */}
                <div
                  style={{
                    backgroundColor: 'rgba(0, 0, 0, 0.65)',
                    backdropFilter: 'blur(10px)',
                    padding: '2.5rem 2rem',
                    borderRadius: '4px',
                    color: '#ffffff',
                    border: '1px solid rgba(255, 255, 255, 0.1)',
                  }}
                >
                  <h3
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '18px',
                      fontWeight: '600',
                      color: '#ffffff',
                      margin: '0 0 1rem',
                      paddingBottom: '0.75rem',
                      borderBottom: '1px solid rgba(255, 255, 255, 0.25)',
                    }}
                  >
                    Neighborhood
                  </h3>
                  <p
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      lineHeight: '1.75',
                      color: '#e2e8f0',
                      margin: 0,
                    }}
                  >
                    {property.aboutSection?.neighborhoodText ||
                      `Perfectly positioned near The Heights and Memorial Park, Woodland Heights offers access to renowned schools, fine dining, and major transit routes while being immersed in a place where community is cherished, and each pathway reflects calm, refinement, and an enduring connection to the land.`}
                  </p>
                </div>
              </div>
            </div>
          </section>

          {/* Section 4: Neighborhood Images Expanding Cards Slider */}
          <section
            className="woodland-neighborhood-images"
            style={{ maxWidth: '1440px', margin: '4rem auto 5rem', padding: '0 1.5rem' }}
          >
            <h2
              style={{
                fontFamily: "'Cormorant Garamond', serif",
                fontSize: '36px',
                fontWeight: '400',
                color: '#1a1a1a',
                margin: '0 0 0.5rem',
              }}
            >
              Neighborhood Images
            </h2>
            <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '1rem 0 2rem' }} />

            {/* Accordion Cards Container */}
            <div
              style={{
                display: 'flex',
                gap: '1.25rem',
                height: '480px',
                width: '100%',
              }}
            >
              {(property.neighborhoodAccordion && property.neighborhoodAccordion.length > 0
                ? property.neighborhoodAccordion.map((item: any) => ({
                    title: item.title,
                    distance: item.distance || '',
                    img: item.image ? getValidImageUrl(item.image) : '/media/gal-img-1.webp',
                  }))
                : [
                    { title: 'Woodland Park', distance: '1.3 Miles', img: '/media/gal-img-1.webp' },
                    { title: 'Hike And Bike Trail', distance: '0.8 Miles', img: '/media/gal-img-2.webp' },
                    { title: 'White Oak Dr', distance: '0 Miles', img: '/media/gal-img-3.webp' },
                    { title: 'Hike And Bike Trail', distance: '0.8 Miles', img: '/media/gal-img-4.webp' },
                  ]
              ).map((card: any, index: number) => {
                const isOpen = activeNeighborhoodCard === index
                return (
                  <div
                    key={index}
                    onMouseEnter={() => setActiveNeighborhoodCard(index)}
                    style={{
                      flexGrow: isOpen ? 3.5 : 1,
                      flexShrink: 1,
                      flexBasis: '0%',
                      position: 'relative',
                      borderRadius: '8px',
                      overflow: 'hidden',
                      cursor: 'pointer',
                      transition: 'flex-grow 0.5s ease-in-out, box-shadow 0.5s ease-in-out',
                      willChange: 'flex-grow',
                      backgroundImage: `url(${card.img})`,
                      backgroundSize: 'cover',
                      backgroundPosition: 'center',
                      boxShadow: isOpen ? '0 12px 30px rgba(0,0,0,0.3)' : '0 4px 15px rgba(0,0,0,0.1)',
                    }}
                  >
                    {/* Dark Vignette Overlay */}
                    <div
                      style={{
                        position: 'absolute',
                        inset: 0,
                        backgroundColor: isOpen ? 'rgba(0, 0, 0, 0.15)' : 'rgba(0, 0, 0, 0.45)',
                        transition: 'background-color 0.5s ease',
                      }}
                    />

                    {/* Card Content: Persistent DOM Nodes to eliminate reflow lag */}
                    <div
                      style={{
                        position: 'absolute',
                        inset: 0,
                        zIndex: 2,
                        color: '#ffffff',
                        pointerEvents: 'none',
                      }}
                    >
                      {/* Horizontal Text (Active Card) */}
                      <div
                        style={{
                          position: 'absolute',
                          bottom: '2rem',
                          left: '2rem',
                          right: '2rem',
                          opacity: isOpen ? 1 : 0,
                          transform: isOpen ? 'translateY(0)' : 'translateY(8px)',
                          transition: 'opacity 0.25s linear 0.15s, transform 0.25s ease 0.15s',
                        }}
                      >
                        <h3
                          style={{
                            fontFamily: "'Montserrat', sans-serif",
                            fontSize: '22px',
                            fontWeight: '700',
                            color: '#ffffff',
                            margin: '0 0 6px',
                            textShadow: '0 2px 10px rgba(0,0,0,0.85)',
                            whiteSpace: 'nowrap',
                          }}
                        >
                          {card.title}
                        </h3>
                        <span
                          style={{
                            fontFamily: "'Montserrat', sans-serif",
                            fontSize: '13px',
                            color: '#f1f5f9',
                            fontWeight: '500',
                            textShadow: '0 2px 8px rgba(0,0,0,0.85)',
                          }}
                        >
                          {card.distance}
                        </span>
                      </div>

                      {/* Vertical Text (Collapsed Card) */}
                      <div
                        style={{
                          position: 'absolute',
                          bottom: '2.5rem',
                          left: '1.75rem',
                          writingMode: 'vertical-rl',
                          transform: 'rotate(180deg)',
                          display: 'flex',
                          gap: '8px',
                          whiteSpace: 'nowrap',
                          opacity: isOpen ? 0 : 1,
                          transition: 'opacity 0.2s linear',
                        }}
                      >
                        <span
                          style={{
                            fontFamily: "'Montserrat', sans-serif",
                            fontSize: '18px',
                            fontWeight: '700',
                            color: '#ffffff',
                            letterSpacing: '0.3px',
                            textShadow: '0 2px 10px rgba(0,0,0,0.95)',
                          }}
                        >
                          {card.title}
                        </span>
                        <span
                          style={{
                            fontFamily: "'Montserrat', sans-serif",
                            fontSize: '13px',
                            color: '#cbd5e1',
                            fontWeight: '500',
                            textShadow: '0 2px 8px rgba(0,0,0,0.95)',
                          }}
                        >
                          {card.distance}
                        </span>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>
          </section>

          {/* Section 5: Experience Elegance In Every Detail Dark Banner */}
          <section
            className="woodland-elegance"
            style={{
              position: 'relative',
              left: '50%',
              transform: 'translateX(-50%)',
              width: '100vw',
              backgroundColor: '#1c1c1c',
              color: '#ffffff',
              padding: '5rem 1.5rem',
              textAlign: 'center',
              margin: '4rem 0 5rem',
            }}
          >
            <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '52px',
                  fontWeight: '300',
                  color: '#ffffff',
                  margin: '0 0 1rem',
                  letterSpacing: '0.8px',
                }}
              >
                {property.eleganceBanner?.title ? (
                  property.eleganceBanner.title
                ) : (
                  <>
                    Experience <span style={{ color: '#c5a880' }}>Elegance</span> In Every Detail
                  </>
                )}
              </h2>

              {/* Thin Divider Line Below Title */}
              <div
                style={{
                  width: '100%',
                  maxWidth: '1000px',
                  height: '1px',
                  backgroundColor: 'rgba(255, 255, 255, 0.15)',
                  margin: '1.25rem auto 1.75rem',
                }}
              />

              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '14px',
                  lineHeight: '1.8',
                  color: '#e2e8f0',
                  maxWidth: '1280px',
                  margin: '0 auto',
                  fontWeight: '300',
                  letterSpacing: '0.2px',
                }}
              >
                {property.eleganceBanner?.description ||
                  `At Novel Signature Homes, we believe the essence of luxury homes lies in their details. Immerse yourself in a world of calm elegance, where thoughtful design and premium materials make each moment feel meaningfully enhanced.`}
              </p>
            </div>
          </section>

          {/* Section 6: Experience Your Future Home Cards */}
          <section
            className="woodland-experience"
            style={{ maxWidth: '1440px', margin: '4.5rem auto 5.5rem', padding: '0 1.5rem' }}
          >
            <h2
              style={{
                fontFamily: "'Cormorant Garamond', serif",
                fontSize: '36px',
                fontWeight: '400',
                color: '#1a1a1a',
                margin: '0 0 0.5rem',
              }}
            >
              Experience Your <span style={{ color: '#8A561F' }}>Future Home</span>
            </h2>
            <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '1rem 0 2rem' }} />

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 380px))', gap: '1.5rem' }}>
              {/* Card 1: All Photos (Always Available) */}
              <div
                onClick={() => setActiveModal('photos')}
                style={{
                  position: 'relative',
                  height: '280px',
                  borderRadius: '4px',
                  overflow: 'hidden',
                  cursor: 'pointer',
                  boxShadow: '0 6px 20px rgba(0,0,0,0.12)',
                }}
              >
                <img
                  src={photosCoverUrl || '/media/2436-WhiteOak-Render-1-1024x573.webp'}
                  alt="All Photos"
                  style={{
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover',
                    transition: 'transform 0.5s ease',
                  }}
                />
                <div
                  style={{
                    position: 'absolute',
                    inset: 0,
                    backgroundColor: 'rgba(0, 0, 0, 0.25)',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    transition: 'background-color 0.3s ease',
                  }}
                >
                  <div
                    style={{
                      padding: '10px 28px',
                      border: '1px solid #ffffff',
                      color: '#ffffff',
                      backgroundColor: 'rgba(0, 0, 0, 0.35)',
                      backdropFilter: 'blur(4px)',
                      fontSize: '14px',
                      fontWeight: '500',
                      fontFamily: "'Montserrat', sans-serif",
                      letterSpacing: '0.5px',
                    }}
                  >
                    All Photos
                  </div>
                </div>
              </div>

              {/* Card 2: All Floor Plans (Conditional) */}
              {hasFloorplans && (
                <div
                  onClick={() => setActiveModal('floorplans')}
                  style={{
                    position: 'relative',
                    height: '280px',
                    borderRadius: '4px',
                    overflow: 'hidden',
                    cursor: 'pointer',
                    boxShadow: '0 6px 20px rgba(0,0,0,0.12)',
                  }}
                >
                  <img
                    src={floorplanCoverUrl || '/media/2434-WhiteOak-Render-1-1024x573.webp'}
                    alt="All Floor Plans"
                    style={{
                      width: '100%',
                      height: '100%',
                      objectFit: 'cover',
                      transition: 'transform 0.5s ease',
                    }}
                  />
                  <div
                    style={{
                      position: 'absolute',
                      inset: 0,
                      backgroundColor: 'rgba(0, 0, 0, 0.25)',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      transition: 'background-color 0.3s ease',
                    }}
                  >
                    <div
                      style={{
                        padding: '10px 28px',
                        border: '1px solid #ffffff',
                        color: '#ffffff',
                        backgroundColor: 'rgba(0, 0, 0, 0.35)',
                        backdropFilter: 'blur(4px)',
                        fontSize: '14px',
                        fontWeight: '500',
                        fontFamily: "'Montserrat', sans-serif",
                        letterSpacing: '0.5px',
                      }}
                    >
                      All Floor Plans
                    </div>
                  </div>
                </div>
              )}

              {/* Card 3: Video (Conditional) */}
              {hasVideo && (
                <div
                  onClick={() => setActiveModal('video')}
                  style={{
                    position: 'relative',
                    height: '280px',
                    borderRadius: '4px',
                    overflow: 'hidden',
                    cursor: 'pointer',
                    boxShadow: '0 6px 20px rgba(0,0,0,0.12)',
                  }}
                >
                  <img
                    src={videoCoverUrl || '/media/gal-img-4.webp'}
                    alt="Video"
                    style={{
                      width: '100%',
                      height: '100%',
                      objectFit: 'cover',
                      transition: 'transform 0.5s ease',
                    }}
                  />
                  <div
                    style={{
                      position: 'absolute',
                      inset: 0,
                      backgroundColor: 'rgba(0, 0, 0, 0.25)',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      transition: 'background-color 0.3s ease',
                    }}
                  >
                    <div
                      style={{
                        padding: '10px 28px',
                        border: '1px solid #ffffff',
                        color: '#ffffff',
                        backgroundColor: 'rgba(0, 0, 0, 0.35)',
                        backdropFilter: 'blur(4px)',
                        fontSize: '14px',
                        fontWeight: '500',
                        fontFamily: "'Montserrat', sans-serif",
                        letterSpacing: '0.5px',
                      }}
                    >
                      Video
                    </div>
                  </div>
                </div>
              )}
            </div>
          </section>



          {/* Section 7: Sub-Units Grid Section ("Explore More In Woodland Heights") */}
          <section
            className="woodland-explore"
            id="sub-units-section"
            style={{ maxWidth: '1440px', margin: '4rem auto 6rem', padding: '0 1.5rem' }}
          >
            <h2
              style={{
                fontFamily: "'Cormorant Garamond', serif",
                fontSize: '36px',
                fontWeight: '400',
                color: '#1a1a1a',
                margin: '0 0 0.5rem',
              }}
            >
              Explore More In <span style={{ color: '#8A561F' }}>{property.name?.toLowerCase().includes('woodland') ? 'Woodland Heights' : (property.name?.split(',')[0] || 'Woodland Heights')}</span>
            </h2>
            <hr style={{ border: 'none', borderTop: '1px solid #e8e1d6', margin: '1rem 0 2.5rem' }} />

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(420px, 1fr))', gap: '2.5rem', marginBottom: '3.5rem' }}>
              {(childProperties && childProperties.length > 0
                ? childProperties
                : [
                    {
                      id: 'w1',
                      name: 'Woodland Heights #1',
                      address: '2436 White Oak Dr, Houston, TX, 77009',
                      slug: '2436-white-oak-dr-houston-tx-77009',
                      status: 'for_sale',
                      bannerImages: [{ url: '/media/2436-WhiteOak-Render-1-1024x573.webp' }],
                      propertySummary: { numberOfBeds: '4', numberOfBaths: '5', acArea: '4,718' },
                    },
                    {
                      id: 'w2',
                      name: 'Woodland Heights #2',
                      address: '2434 White Oak Dr, Houston, TX, 77009',
                      slug: '2434-white-oak-dr-houston-tx-77009',
                      status: 'for_sale',
                      bannerImages: [{ url: '/media/2434-WhiteOak-Render-1-1024x573.webp' }],
                      propertySummary: { numberOfBeds: '4', numberOfBaths: '6', acArea: '4,658' },
                    },
                  ]
              ).map((unit: any) => {
                const unitImg =
                  (unit.bannerImages && unit.bannerImages.length > 0 && getValidImageUrl(unit.bannerImages[0])) ||
                  '/media/2436-WhiteOak-Render-1-1024x573.webp'

                return (
                  <Link
                    key={unit.id}
                    href={`/properties/${unit.slug}`}
                    style={{ textDecoration: 'none', color: 'inherit' }}
                  >
                    <div style={{ cursor: 'pointer' }}>
                      {/* Card Image Container */}
                      <div
                        style={{
                          position: 'relative',
                          width: '100%',
                          aspectRatio: '16/9',
                          borderRadius: '4px',
                          overflow: 'hidden',
                          marginBottom: '1.25rem',
                          boxShadow: '0 6px 20px rgba(0,0,0,0.08)',
                        }}
                      >
                        <img
                          src={unitImg}
                          alt={unit.name}
                          style={{ width: '100%', height: '100%', objectFit: 'cover', transition: 'transform 0.5s ease' }}
                        />
                      </div>

                      {/* Card Content Row */}
                      <div
                        style={{
                          display: 'flex',
                          justifyContent: 'space-between',
                          alignItems: 'flex-start',
                          gap: '1rem',
                        }}
                      >
                        {/* Title & Address (Left) */}
                        <div>
                          <h3
                            style={{
                              fontFamily: "'Montserrat', sans-serif",
                              fontSize: '16px',
                              fontWeight: '700',
                              color: '#1a1a1a',
                              margin: '0 0 4px',
                            }}
                          >
                            {unit.name}
                          </h3>
                          <p
                            style={{
                              fontFamily: "'Montserrat', sans-serif",
                              fontSize: '13px',
                              color: '#64748b',
                              margin: 0,
                            }}
                          >
                            {unit.address}
                          </p>
                        </div>

                        {/* Specs & Link (Right) */}
                        <div style={{ textAlign: 'right', flexShrink: 0 }}>
                          <div
                            style={{
                              fontFamily: "'Montserrat', sans-serif",
                              fontSize: '13px',
                              fontWeight: '500',
                              color: '#334155',
                              marginBottom: '4px',
                            }}
                          >
                            {unit.propertySummary?.numberOfBeds || '4'} BD | {unit.propertySummary?.numberOfBaths || '5'} BA | Liv Space : {unit.propertySummary?.acArea || '4,718'}
                          </div>
                          <span
                            style={{
                              fontFamily: "'Montserrat', sans-serif",
                              fontSize: '13px',
                              fontWeight: '600',
                              color: '#8A561F',
                              display: 'inline-block',
                            }}
                          >
                            View Property &raquo;
                          </span>
                        </div>
                      </div>
                    </div>
                  </Link>
                )
              })}
            </div>

            {/* View All Properties Button */}
            <div style={{ textAlign: 'center' }}>
              <Link
                href="/properties"
                style={{
                  display: 'inline-block',
                  padding: '12px 36px',
                  border: '1px solid #1a1a1a',
                  backgroundColor: '#ffffff',
                  color: '#1a1a1a',
                  textDecoration: 'none',
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '13px',
                  fontWeight: '500',
                  letterSpacing: '0.5px',
                  borderRadius: '2px',
                  transition: 'all 0.3s ease',
                }}
              >
                View All Properties
              </Link>
            </div>
          </section>
        </div>
      ) ) : (
        <div>
          {/* Hero Property Image Carousel Banner */}
          <section style={{ maxWidth: '1440px', margin: '1rem auto 3rem', padding: '0 1.5rem' }}>
            <div
              style={{
                position: 'relative',
                width: '100%',
                height: '70vh',
                backgroundColor: '#e2e8f0',
                overflow: 'hidden',
              }}
            >
              {property.bannerImages &&
              property.bannerImages.length > 0 &&
              property.bannerImages[0]?.url ? (
                <img
                  src={property.bannerImages[0].url}
                  alt={property.name}
                  style={{ width: '100%', height: '100%', objectFit: 'cover' }}
                />
              ) : (
                <img
                  src="https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp"
                  alt={property.name}
                  style={{ width: '100%', height: '100%', objectFit: 'cover' }}
                />
              )}

              {/* Bottom Right Overlay Button */}
              <div style={{ position: 'absolute', bottom: '25px', right: '30px', zIndex: 10 }}>
                <div
                  onClick={() => setActiveModal('floorplans')}
                  style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '12px',
                    padding: '10px 20px',
                    border: '1px solid rgba(255,255,255,0.7)',
                    backgroundColor: 'rgba(255, 255, 255, 0.25)',
                    backdropFilter: 'blur(6px)',
                    color: '#ffffff',
                    textDecoration: 'none',
                    cursor: 'pointer',
                    boxShadow: '0px 2px 10px rgba(0,0,0,0.3)',
                  }}
                >
                  <span style={{ fontSize: '1.25rem' }}>📑</span>
                  <div>
                    <div style={{ fontWeight: '600', fontSize: '13px', lineHeight: '1.2' }}>
                      Floor Plan
                    </div>
                    <div style={{ fontSize: '11px', opacity: 0.9 }}>Explore the Layout</div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          {/* Main Content Area */}
          <main style={{ maxWidth: '1440px', margin: '0 auto', padding: '0 1.5rem 4rem' }}>
            <div
              style={{
                display: 'grid',
                gridTemplateColumns: 'minmax(0, 1fr) 380px',
                gap: '3rem',
                alignItems: 'start',
              }}
            >
              {/* Left Column */}
              <div>
                {/* Title & Price Header */}
                <div
                  style={{
                    display: 'flex',
                    justifyContent: 'space-between',
                    alignItems: 'flex-start',
                    flexWrap: 'wrap',
                    gap: '1rem',
                    marginBottom: '2.5rem',
                  }}
                >
                  <div>
                    <h1
                      style={{
                        fontFamily: "'Montserrat', sans-serif",
                        fontSize: '22px',
                        fontWeight: '500',
                        color: '#525252',
                        margin: 0,
                        lineHeight: '1.3',
                      }}
                    >
                      {property.name?.split(',')[0] || '3224 Amherst Avenue'}
                      <br />
                      <span style={{ fontSize: '16px', fontWeight: '300', color: '#525252' }}>
                        {property.address || 'Dallas, Texas, 75225'}
                      </span>
                    </h1>
                  </div>
                  <div>
                    <h2
                      style={{
                        fontFamily: "'Montserrat', sans-serif",
                        fontSize: '30px',
                        fontWeight: '700',
                        color: '#1a1a1a',
                        margin: 0,
                      }}
                    >
                      {property.price || '$4,894,000'}
                    </h2>
                  </div>
                </div>

                {/* 4 Summary Highlight Box Grid */}
                <div
                  style={{
                    display: 'flex',
                    alignItems: 'stretch',
                    border: '1px solid #e8e1d6',
                    backgroundColor: '#fcfcfc',
                    marginBottom: '2.5rem',
                  }}
                >
                  <div
                    style={{
                      flex: '1',
                      padding: '1.25rem 0.75rem',
                      textAlign: 'center',
                      borderRight: '1px solid #e8e1d6',
                      display: 'flex',
                      flexDirection: 'column',
                      justifyContent: 'center',
                      alignItems: 'center',
                    }}
                  >
                    <div
                      style={{
                        fontSize: '24px',
                        fontWeight: '400',
                        color: '#1a1a1a',
                        fontFamily: "'Montserrat', sans-serif",
                        lineHeight: '1.2',
                      }}
                    >
                      {property.propertySummary?.numberOfBeds || '-'}
                    </div>
                    <div
                      style={{
                        fontSize: '13px',
                        color: '#737373',
                        marginTop: '0.35rem',
                        fontWeight: '400',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      Beds
                    </div>
                  </div>

                  <div
                    style={{
                      flex: '1',
                      padding: '1.25rem 0.75rem',
                      textAlign: 'center',
                      borderRight: '1px solid #e8e1d6',
                      display: 'flex',
                      flexDirection: 'column',
                      justifyContent: 'center',
                      alignItems: 'center',
                    }}
                  >
                    <div
                      style={{
                        fontSize: '24px',
                        fontWeight: '400',
                        color: '#1a1a1a',
                        fontFamily: "'Montserrat', sans-serif",
                        lineHeight: '1.2',
                      }}
                    >
                      {property.propertySummary?.numberOfBaths || '-'}
                    </div>
                    <div
                      style={{
                        fontSize: '13px',
                        color: '#737373',
                        marginTop: '0.35rem',
                        fontWeight: '400',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      Baths
                    </div>
                  </div>

                  <div
                    style={{
                      flex: '1.2',
                      padding: '1.25rem 0.75rem',
                      textAlign: 'center',
                      borderRight: '1px solid #e8e1d6',
                      display: 'flex',
                      flexDirection: 'column',
                      justifyContent: 'center',
                      alignItems: 'center',
                    }}
                  >
                    <div
                      style={{
                        fontSize: '24px',
                        fontWeight: '400',
                        color: '#1a1a1a',
                        fontFamily: "'Montserrat', sans-serif",
                        lineHeight: '1.2',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      {property.propertySummary?.acArea || '-'}
                    </div>
                    <div
                      style={{
                        fontSize: '13px',
                        color: '#737373',
                        marginTop: '0.35rem',
                        fontWeight: '400',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      AC Area
                    </div>
                  </div>

                  <div
                    style={{
                      flex: '1.8',
                      padding: '1.25rem 0.75rem',
                      textAlign: 'center',
                      display: 'flex',
                      flexDirection: 'column',
                      justifyContent: 'center',
                      alignItems: 'center',
                    }}
                  >
                    <div
                      style={{
                        fontSize: '24px',
                        fontWeight: '400',
                        color: '#1a1a1a',
                        fontFamily: "'Montserrat', sans-serif",
                        lineHeight: '1.2',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      {property.propertySummary?.designTheme || '-'}
                    </div>
                    <div
                      style={{
                        fontSize: '13px',
                        color: '#737373',
                        marginTop: '0.35rem',
                        fontWeight: '400',
                        whiteSpace: 'nowrap',
                      }}
                    >
                      Design Theme
                    </div>
                  </div>
                </div>

                {/* Description Paragraph */}
                <div style={{ marginBottom: '3rem' }}>
                  <p
                    style={{
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '15px',
                      fontWeight: '400',
                      lineHeight: '1.75',
                      color: '#333333',
                      margin: 0,
                    }}
                  >
                    {property.description ||
                      `Welcome to our luxury single-family home, located in one of Texas' finest neighborhoods. This stunning ${property.propertySummary?.acArea || '5,897'} sq. ft. residence features ${property.propertySummary?.numberOfBeds || '5'} spacious bedrooms, ${property.featuresAndAmenities?.bedsAndBaths?.baths || '5 Full, 2 Half Baths'}, perfect for modern living. Designed by renowned architect ${property.architectName || 'Clay Nelson'}, with interiors curated by acclaimed designer ${property.interiorDesignName || 'Kevin Spearman'}, every detail of this home reflects exceptional craftsmanship. Built by ${property.builderName || 'Gilbert Homes'}, a trusted name, the property showcases premium quality and luxury in every corner.`}
                  </p>
                </div>

                {/* Key Professionals Grid */}
                <div
                  style={{
                    display: 'grid',
                    gridTemplateColumns: '1fr 1fr',
                    gap: '2rem 3rem',
                    paddingTop: '1rem',
                  }}
                >
                  {property.brokerInformation?.brokerName && (
                    <div>
                      <span
                        style={{
                          fontSize: '13px',
                          color: '#888888',
                          display: 'block',
                          marginBottom: '0.25rem',
                        }}
                      >
                        Broker
                      </span>
                      <span style={{ fontSize: '15px', fontWeight: '700', color: '#1a1a1a' }}>
                        {property.brokerInformation.brokerName}
                      </span>
                    </div>
                  )}
                  {property.builderName && (
                    <div>
                      <span
                        style={{
                          fontSize: '13px',
                          color: '#888888',
                          display: 'block',
                          marginBottom: '0.25rem',
                        }}
                      >
                        Builder
                      </span>
                      <span style={{ fontSize: '15px', fontWeight: '700', color: '#1a1a1a' }}>
                        {property.builderName}
                      </span>
                    </div>
                  )}
                  {property.architectName && (
                    <div>
                      <span
                        style={{
                          fontSize: '13px',
                          color: '#888888',
                          display: 'block',
                          marginBottom: '0.25rem',
                        }}
                      >
                        Architect
                      </span>
                      <span style={{ fontSize: '15px', fontWeight: '700', color: '#1a1a1a' }}>
                        {property.architectName}
                      </span>
                    </div>
                  )}
                  {property.interiorDesignName && (
                    <div>
                      <span
                        style={{
                          fontSize: '13px',
                          color: '#888888',
                          display: 'block',
                          marginBottom: '0.25rem',
                        }}
                      >
                        Interior Designer
                      </span>
                      <span style={{ fontSize: '15px', fontWeight: '700', color: '#1a1a1a' }}>
                        {property.interiorDesignName}
                      </span>
                    </div>
                  )}
                </div>
              </div>

              {/* Right Column: CONDITIONAL SIDEBAR BASED ON PROPERTY STATUS */}
              {status === 'for_sale' ? (
                /* 1. FOR SALE: Inquire Contact Form Card */
                <div
                  style={{
                    backgroundColor: '#181818',
                    color: '#ffffff',
                    padding: '2.25rem 2rem',
                    boxShadow: '0 4px 20px rgba(0,0,0,0.15)',
                  }}
                >
                  <h2
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '26px',
                      fontWeight: '400',
                      fontStyle: 'italic',
                      color: '#ffffff',
                      margin: '0 0 0.5rem',
                      textAlign: 'center',
                    }}
                  >
                    Inquire About The Property
                  </h2>
                  <p
                    style={{
                      fontSize: '12px',
                      color: '#b3b3b3',
                      textAlign: 'center',
                      margin: '0 0 2rem',
                      lineHeight: '1.5',
                    }}
                  >
                    See yourself living here? Let us help you make it happen.
                  </p>

                  {/* Broker Avatar & Contact Agent Button */}
                  <div
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'space-between',
                      marginBottom: '1.75rem',
                      borderBottom: '1px solid #2d2d2d',
                      paddingBottom: '1.5rem',
                    }}
                  >
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
                      <img
                        src={
                          property.brokerInformation?.brokerImage?.url ||
                          'https://novelsignaturehomes.com/wp-content/uploads/2024/10/jhonathan.webp'
                        }
                        alt={property.brokerInformation?.brokerName || 'Broker'}
                        style={{
                          width: '54px',
                          height: '54px',
                          borderRadius: '50%',
                          objectFit: 'cover',
                        }}
                      />
                      <div>
                        <div style={{ fontSize: '14px', fontWeight: '700', color: '#ffffff' }}>
                          {property.brokerInformation?.brokerName || 'Jonathan Rosen'}
                        </div>
                        <div style={{ fontSize: '11px', color: '#a3a3a3', letterSpacing: '0.5px' }}>
                          {property.brokerInformation?.companyName || 'COMPASS'}
                        </div>
                      </div>
                    </div>
                    <button
                      type="button"
                      style={{
                        backgroundColor: '#dfcbb5',
                        color: '#1a1a1a',
                        padding: '0.55rem 1.1rem',
                        border: 'none',
                        fontSize: '12px',
                        fontWeight: '700',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                      }}
                    >
                      <span>📞</span> Contact Agent
                    </button>
                  </div>

                  {/* Contact Form */}
                  {sidebarStatus === 'success' ? (
                    <div style={{ backgroundColor: '#22543d', border: '1px solid #2f855a', color: '#c6f6d5', padding: '1.5rem', borderRadius: '4px', textAlign: 'center', margin: '1rem 0' }}>
                      <h3 style={{ margin: '0 0 6px', fontSize: '16px', fontWeight: 600 }}>Thank You!</h3>
                      <p style={{ margin: 0, fontSize: '13px' }}>Your inquiry has been received. Our agent will reach out shortly.</p>
                    </div>
                  ) : (
                    <form onSubmit={handleSidebarSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                      {sidebarStatus === 'error' && (
                        <div style={{ backgroundColor: '#742a2a', border: '1px solid #9b2c2c', color: '#fed7d7', padding: '10px 14px', borderRadius: '2px', fontSize: '12px' }}>
                          {sidebarError}
                        </div>
                      )}
                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            color: '#cccccc',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Name<span style={{ color: '#ef4444' }}>*</span>
                        </label>
                        <input
                          type="text"
                          required
                          value={sidebarState.name}
                          onChange={(e) => setSidebarState({ ...sidebarState, name: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '0.65rem 0.85rem',
                            backgroundColor: '#262626',
                            border: '1px solid #333333',
                            color: '#ffffff',
                            fontSize: '14px',
                            outline: 'none',
                          }}
                        />
                      </div>

                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            color: '#cccccc',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Phone
                        </label>
                        <input
                          type="tel"
                          value={sidebarState.phone}
                          onChange={(e) => setSidebarState({ ...sidebarState, phone: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '0.65rem 0.85rem',
                            backgroundColor: '#262626',
                            border: '1px solid #333333',
                            color: '#ffffff',
                            fontSize: '14px',
                            outline: 'none',
                          }}
                        />
                      </div>

                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            color: '#cccccc',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Email<span style={{ color: '#ef4444' }}>*</span>
                        </label>
                        <input
                          type="email"
                          required
                          value={sidebarState.email}
                          onChange={(e) => setSidebarState({ ...sidebarState, email: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '0.65rem 0.85rem',
                            backgroundColor: '#262626',
                            border: '1px solid #333333',
                            color: '#ffffff',
                            fontSize: '14px',
                            outline: 'none',
                          }}
                        />
                      </div>

                      <div>
                        <label
                          style={{
                            display: 'block',
                            fontSize: '12px',
                            color: '#cccccc',
                            marginBottom: '0.35rem',
                          }}
                        >
                          Message
                        </label>
                        <textarea
                          rows={3}
                          value={sidebarState.message}
                          onChange={(e) => setSidebarState({ ...sidebarState, message: e.target.value })}
                          style={{
                            width: '100%',
                            padding: '0.65rem 0.85rem',
                            backgroundColor: '#262626',
                            border: '1px solid #333333',
                            color: '#ffffff',
                            fontSize: '14px',
                            outline: 'none',
                            resize: 'vertical',
                          }}
                        />
                      </div>

                      <div style={{ textAlign: 'center', marginTop: '0.5rem' }}>
                        <button
                          type="submit"
                          disabled={sidebarStatus === 'submitting'}
                          style={{
                            backgroundColor: '#000000',
                            color: '#ffffff',
                            border: '1px solid #333333',
                            padding: '0.75rem 2.5rem',
                            fontSize: '13px',
                            fontWeight: '600',
                            cursor: sidebarStatus === 'submitting' ? 'not-allowed' : 'pointer',
                            opacity: sidebarStatus === 'submitting' ? 0.7 : 1,
                            textTransform: 'uppercase',
                            letterSpacing: '1px',
                          }}
                        >
                          {sidebarStatus === 'submitting' ? 'Submitting...' : 'Submit'}
                        </button>
                      </div>
                    </form>
                  )}
                </div>
              ) : status === 'sold' ? (
                /* 2. SOLD OUT Card matching exact screenshot */
                <div
                  style={{
                    backgroundColor: '#181818',
                    color: '#ffffff',
                    padding: '4rem 2rem',
                    textAlign: 'center',
                    boxShadow: '0 4px 20px rgba(0,0,0,0.15)',
                  }}
                >
                  <div
                    style={{
                      fontSize: '14px',
                      color: '#cccccc',
                      marginBottom: '0.75rem',
                      fontWeight: '300',
                    }}
                  >
                    This Property is
                  </div>
                  <div
                    style={{
                      fontSize: '26px',
                      fontWeight: '700',
                      color: '#ffffff',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '0.75rem',
                      marginBottom: '2.5rem',
                      textTransform: 'uppercase',
                      letterSpacing: '1.5px',
                    }}
                  >
                    <span
                      style={{
                        display: 'inline-block',
                        width: '22px',
                        height: '22px',
                        borderRadius: '50%',
                        backgroundColor: '#ff0000',
                      }}
                    ></span>
                    SOLD OUT
                  </div>
                  <div
                    style={{
                      fontSize: '13px',
                      color: '#a3a3a3',
                      marginBottom: '2.5rem',
                      fontFamily: "'Cormorant Garamond', serif",
                      fontStyle: 'italic',
                      lineHeight: '1.5',
                    }}
                  >
                    Explore The Collection Of Our Signature Residences
                  </div>
                  <Link
                    href="/properties"
                    style={{
                      display: 'inline-block',
                      backgroundColor: '#ffffff',
                      color: '#1a1a1a',
                      padding: '0.75rem 2.25rem',
                      fontSize: '13px',
                      fontWeight: '600',
                      textDecoration: 'none',
                    }}
                  >
                    View more
                  </Link>
                </div>
              ) : (
                /* 3. UNDER CONTRACT Card */
                <div
                  style={{
                    backgroundColor: '#181818',
                    color: '#ffffff',
                    padding: '4rem 2rem',
                    textAlign: 'center',
                    boxShadow: '0 4px 20px rgba(0,0,0,0.15)',
                  }}
                >
                  <div
                    style={{
                      fontSize: '14px',
                      color: '#cccccc',
                      marginBottom: '0.75rem',
                      fontWeight: '300',
                    }}
                  >
                    This Property is
                  </div>
                  <div
                    style={{
                      fontSize: '24px',
                      fontWeight: '700',
                      color: '#ffffff',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '0.75rem',
                      marginBottom: '2.5rem',
                      textTransform: 'uppercase',
                      letterSpacing: '1.5px',
                    }}
                  >
                    <span
                      style={{
                        display: 'inline-block',
                        width: '22px',
                        height: '22px',
                        borderRadius: '50%',
                        backgroundColor: '#eab308',
                      }}
                    ></span>
                    UNDER CONTRACT
                  </div>
                  <div
                    style={{
                      fontSize: '13px',
                      color: '#a3a3a3',
                      marginBottom: '2.5rem',
                      fontFamily: "'Cormorant Garamond', serif",
                      fontStyle: 'italic',
                      lineHeight: '1.5',
                    }}
                  >
                    Explore The Collection Of Our Signature Residences
                  </div>
                  <Link
                    href="/properties"
                    style={{
                      display: 'inline-block',
                      backgroundColor: '#ffffff',
                      color: '#1a1a1a',
                      padding: '0.75rem 2.25rem',
                      fontSize: '13px',
                      fontWeight: '600',
                      textDecoration: 'none',
                    }}
                  >
                    View more
                  </Link>
                </div>
              )}
            </div>
          </main>

          {/* FEATURES AND AMENITIES Section */}
          <section style={{ backgroundColor: '#181818', color: '#ffffff', padding: '5rem 1.5rem' }}>
            <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '38px',
                  fontWeight: '400',
                  letterSpacing: '2px',
                  color: '#ffffff',
                  borderBottom: '1px solid #333333',
                  paddingBottom: '1rem',
                  marginBottom: '3rem',
                  textTransform: 'uppercase',
                }}
              >
                FEATURES AND AMENITIES
              </h2>

              {/* Accordion List */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
                {/* 1. Property Details Accordion */}
                <div
                  style={{
                    border: '1px solid #dfcbb6',
                    backgroundColor: '#181818',
                    marginBottom: '1rem',
                  }}
                >
                  <button
                    type="button"
                    onClick={() => toggleAccordion('propertyDetails')}
                    style={{
                      width: '100%',
                      padding: '1.25rem 1.75rem',
                      backgroundColor: 'transparent',
                      border: 'none',
                      color: '#dfcbb6',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      cursor: 'pointer',
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      fontWeight: '500',
                      letterSpacing: '1.5px',
                      textTransform: 'uppercase',
                    }}
                  >
                    <span>PROPERTY DETAILS</span>
                    <svg
                      width="12"
                      height="12"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="2"
                      style={{
                        transform: openAccordions.propertyDetails
                          ? 'rotate(180deg)'
                          : 'rotate(0deg)',
                        transition: 'transform 0.25s ease',
                        color: '#dfcbb6',
                      }}
                    >
                      <path d="M19 9l-7 7-7-7" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  </button>

                  {openAccordions.propertyDetails && (
                    <div style={{ padding: '0 2rem 2rem', borderTop: '1px solid #2a2a2a' }}>
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: '1fr 1fr',
                          gap: '2rem 4rem',
                          paddingTop: '1.5rem',
                        }}
                      >
                        {property.featuresAndAmenities?.propertyDetails?.propertyType && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              PROPERTY TYPE:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.propertyDetails.propertyType}
                            </div>
                          </div>
                        )}
                        {property.featuresAndAmenities?.propertyDetails?.yearBuilt && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              YEAR BUILT:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.propertyDetails.yearBuilt}
                            </div>
                          </div>
                        )}
                        {property.featuresAndAmenities?.propertyDetails
                          ?.totalInteriorLivableArea && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              TOTAL INTERIOR LIVABLE AREA:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {
                                property.featuresAndAmenities.propertyDetails
                                  .totalInteriorLivableArea
                              }
                            </div>
                          </div>
                        )}
                        {property.featuresAndAmenities?.propertyDetails?.lotSize && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              LOT SIZE:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.propertyDetails.lotSize}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>

                {/* 2. Beds & Baths Accordion */}
                <div
                  style={{
                    border: '1px solid #dfcbb6',
                    backgroundColor: '#181818',
                    marginBottom: '1rem',
                  }}
                >
                  <button
                    type="button"
                    onClick={() => toggleAccordion('bedsAndBaths')}
                    style={{
                      width: '100%',
                      padding: '1.25rem 1.75rem',
                      backgroundColor: 'transparent',
                      border: 'none',
                      color: '#dfcbb6',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      cursor: 'pointer',
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      fontWeight: '500',
                      letterSpacing: '1.5px',
                      textTransform: 'uppercase',
                    }}
                  >
                    <span>BEDS & BATHS</span>
                    <svg
                      width="12"
                      height="12"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="2"
                      style={{
                        transform: openAccordions.bedsAndBaths ? 'rotate(180deg)' : 'rotate(0deg)',
                        transition: 'transform 0.25s ease',
                        color: '#dfcbb6',
                      }}
                    >
                      <path d="M19 9l-7 7-7-7" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  </button>

                  {openAccordions.bedsAndBaths && (
                    <div style={{ padding: '0 2rem 2rem', borderTop: '1px solid #2a2a2a' }}>
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: '1fr 1fr 1fr',
                          gap: '2rem',
                          paddingTop: '1.5rem',
                        }}
                      >
                        {property.featuresAndAmenities?.bedsAndBaths?.beds && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              BEDS:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.bedsAndBaths.beds}
                            </div>
                          </div>
                        )}
                        {property.featuresAndAmenities?.bedsAndBaths?.baths && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              BATHS:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.bedsAndBaths.baths}
                            </div>
                          </div>
                        )}
                        {property.featuresAndAmenities?.bedsAndBaths?.numberOfFloors && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              FLOORS:
                            </div>
                            <div style={{ fontSize: '15px', fontWeight: '700', color: '#ffffff' }}>
                              {property.featuresAndAmenities.bedsAndBaths.numberOfFloors}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>

                {/* 3. Interior Features Accordion */}
                <div
                  style={{
                    border: '1px solid #dfcbb6',
                    backgroundColor: '#181818',
                    marginBottom: '1rem',
                  }}
                >
                  <button
                    type="button"
                    onClick={() => toggleAccordion('interiorFeatures')}
                    style={{
                      width: '100%',
                      padding: '1.25rem 1.75rem',
                      backgroundColor: 'transparent',
                      border: 'none',
                      color: '#dfcbb6',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      cursor: 'pointer',
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      fontWeight: '500',
                      letterSpacing: '1.5px',
                      textTransform: 'uppercase',
                    }}
                  >
                    <span>INTERIOR FEATURES</span>
                    <svg
                      width="12"
                      height="12"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="2"
                      style={{
                        transform: openAccordions.interiorFeatures
                          ? 'rotate(180deg)'
                          : 'rotate(0deg)',
                        transition: 'transform 0.25s ease',
                        color: '#dfcbb6',
                      }}
                    >
                      <path d="M19 9l-7 7-7-7" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  </button>

                  {openAccordions.interiorFeatures && (
                    <div style={{ padding: '0 2rem 2rem', borderTop: '1px solid #2a2a2a' }}>
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: '1fr 1fr',
                          gap: '2rem 3rem',
                          paddingTop: '1.5rem',
                        }}
                      >
                        {intFeat.firstFloor && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.35rem',
                              }}
                            >
                              1ST FLOOR:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', lineHeight: '1.6' }}>
                              {intFeat.firstFloor}
                            </div>
                          </div>
                        )}

                        {intFeat.secondFloor && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.35rem',
                              }}
                            >
                              2ND FLOOR:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', lineHeight: '1.6' }}>
                              {intFeat.secondFloor}
                            </div>
                          </div>
                        )}

                        {intFeat.thirdFloor && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.35rem',
                              }}
                            >
                              3RD FLOOR:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', lineHeight: '1.6' }}>
                              {intFeat.thirdFloor}
                            </div>
                          </div>
                        )}

                        {intFeat.additionalFeatures && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.35rem',
                              }}
                            >
                              ADDITIONAL FEATURES:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', lineHeight: '1.6' }}>
                              {intFeat.additionalFeatures}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>

                {/* 4. Exterior Features Accordion */}
                <div
                  style={{
                    border: '1px solid #dfcbb6',
                    backgroundColor: '#181818',
                    marginBottom: '1rem',
                  }}
                >
                  <button
                    type="button"
                    onClick={() => toggleAccordion('exteriorFeatures')}
                    style={{
                      width: '100%',
                      padding: '1.25rem 1.75rem',
                      backgroundColor: 'transparent',
                      border: 'none',
                      color: '#dfcbb6',
                      display: 'flex',
                      justifyContent: 'space-between',
                      alignItems: 'center',
                      cursor: 'pointer',
                      fontFamily: "'Montserrat', sans-serif",
                      fontSize: '13px',
                      fontWeight: '500',
                      letterSpacing: '1.5px',
                      textTransform: 'uppercase',
                    }}
                  >
                    <span>EXTERIOR FEATURES</span>
                    <svg
                      width="12"
                      height="12"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="2"
                      style={{
                        transform: openAccordions.exteriorFeatures
                          ? 'rotate(180deg)'
                          : 'rotate(0deg)',
                        transition: 'transform 0.25s ease',
                        color: '#dfcbb6',
                      }}
                    >
                      <path d="M19 9l-7 7-7-7" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  </button>

                  {openAccordions.exteriorFeatures && (
                    <div style={{ padding: '0 2rem 2rem', borderTop: '1px solid #2a2a2a' }}>
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: 'repeat(3, 1fr)',
                          gap: '2rem 3rem',
                          paddingTop: '1.5rem',
                        }}
                      >
                        {extFeat.garage && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              GARAGE:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.garage}
                            </div>
                          </div>
                        )}
                        {extFeat.yard && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              YARD:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.yard}
                            </div>
                          </div>
                        )}
                        {extFeat.pool && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              POOL:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.pool}
                            </div>
                          </div>
                        )}
                        {extFeat.siding && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              SIDING:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.siding}
                            </div>
                          </div>
                        )}
                        {extFeat.driveway && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              DRIVEWAY:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.driveway}
                            </div>
                          </div>
                        )}
                        {extFeat.roof && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              ROOF:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.roof}
                            </div>
                          </div>
                        )}
                        {extFeat.deckPatio && (
                          <div>
                            <div
                              style={{
                                fontSize: '11px',
                                color: '#a3a3a3',
                                letterSpacing: '1px',
                                textTransform: 'uppercase',
                                marginBottom: '0.25rem',
                              }}
                            >
                              DECK/ PATIO:
                            </div>
                            <div style={{ fontSize: '14px', color: '#ffffff', fontWeight: '600' }}>
                              {extFeat.deckPatio}
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </section>

          {/* EXPERIENCE YOUR FUTURE HOME Section */}
          <section
            style={{
              backgroundColor: '#ffffff',
              padding: '5rem 1.5rem',
              borderBottom: '1px solid #e8e1d6',
            }}
          >
            <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '42px',
                  fontWeight: '400',
                  color: '#1a1a1a',
                  margin: '0 0 2.5rem',
                }}
              >
                Experience Your <span style={{ color: '#8A561F' }}>Future Home</span>
              </h2>

              <div
                style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '1.5rem' }}
              >
                {/* Card 1: All Photos */}
                <div
                  onClick={() => setActiveModal('photos')}
                  style={{
                    position: 'relative',
                    height: '220px',
                    backgroundColor: '#262626',
                    cursor: 'pointer',
                    overflow: 'hidden',
                  }}
                >
                  <img
                    src={photosCoverUrl}
                    alt="All Photos"
                    style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.8 }}
                  />
                  <div
                    style={{
                      position: 'absolute',
                      inset: 0,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }}
                  >
                    <div
                      style={{
                        padding: '8px 20px',
                        border: '1px solid #ffffff',
                        color: '#ffffff',
                        backgroundColor: 'rgba(0,0,0,0.4)',
                        fontSize: '14px',
                        fontWeight: '500',
                      }}
                    >
                      All Photos
                    </div>
                  </div>
                </div>

                {/* Card 2: All Floor Plans */}
                <div
                  onClick={() => setActiveModal('floorplans')}
                  style={{
                    position: 'relative',
                    height: '220px',
                    backgroundColor: '#171717',
                    cursor: 'pointer',
                    overflow: 'hidden',
                  }}
                >
                  <img
                    src={floorplanCoverUrl}
                    alt="All Floor Plans"
                    style={{
                      width: '100%',
                      height: '100%',
                      objectFit: 'cover',
                      opacity: 0.4,
                      filter: 'grayscale(100%)',
                    }}
                  />
                  <div
                    style={{
                      position: 'absolute',
                      inset: 0,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }}
                  >
                    <div
                      style={{
                        padding: '8px 20px',
                        border: '1px solid #ffffff',
                        color: '#ffffff',
                        backgroundColor: 'rgba(0,0,0,0.4)',
                        fontSize: '14px',
                        fontWeight: '500',
                      }}
                    >
                      All Floor Plans
                    </div>
                  </div>
                </div>

                {/* Card 3: Video */}
                <div
                  onClick={() => setActiveModal('video')}
                  style={{
                    position: 'relative',
                    height: '220px',
                    backgroundColor: '#262626',
                    cursor: 'pointer',
                    overflow: 'hidden',
                  }}
                >
                  <img
                    src={videoCoverUrl}
                    alt="Video Showcase"
                    style={{ width: '100%', height: '100%', objectFit: 'cover', opacity: 0.8 }}
                  />
                  <div
                    style={{
                      position: 'absolute',
                      inset: 0,
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }}
                  >
                    <div
                      style={{
                        padding: '8px 20px',
                        border: '1px solid #ffffff',
                        color: '#ffffff',
                        backgroundColor: 'rgba(0,0,0,0.4)',
                        fontSize: '14px',
                        fontWeight: '500',
                      }}
                    >
                      Video
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          {/* OTHER PROPERTIES SWIPER CAROUSEL Section */}
          <section
            style={{
              backgroundColor: '#fafafa',
              padding: '5rem 1.5rem',
              borderBottom: '1px solid #e8e1d6',
            }}
          >
            <div style={{ maxWidth: '1440px', margin: '0 auto' }}>
              {/* Section Heading */}
              <h2
                style={{
                  fontFamily: "'Cormorant Garamond', serif",
                  fontSize: '42px',
                  fontWeight: '400',
                  color: '#1a1a1a',
                  margin: '0 0 2.5rem',
                }}
              >
                Other <span style={{ color: '#8A561F' }}>Properties</span>
              </h2>

              {/* Swiper Container Wrapper with Far Left & Right Navigation Arrows */}
              <div style={{ position: 'relative' }}>
                {/* Left Navigation Arrow (Far Left, Vertically Centered) */}
                <button
                  type="button"
                  onClick={slideLeft}
                  style={{
                    position: 'absolute',
                    left: '-24px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    width: '48px',
                    height: '48px',
                    borderRadius: '50%',
                    backgroundColor: '#ffffff',
                    border: '1px solid #e5e7eb',
                    color: '#1a1a1a',
                    fontSize: '24px',
                    lineHeight: '1',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    boxShadow: '0 4px 14px rgba(0,0,0,0.12)',
                    zIndex: 30,
                  }}
                  aria-label="Previous Property"
                >
                  ‹
                </button>

                {/* Right Navigation Arrow (Far Right, Vertically Centered) */}
                <button
                  type="button"
                  onClick={slideRight}
                  style={{
                    position: 'absolute',
                    right: '-24px',
                    top: '50%',
                    transform: 'translateY(-50%)',
                    width: '48px',
                    height: '48px',
                    borderRadius: '50%',
                    backgroundColor: '#ffffff',
                    border: '1px solid #e5e7eb',
                    color: '#1a1a1a',
                    fontSize: '24px',
                    lineHeight: '1',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    boxShadow: '0 4px 14px rgba(0,0,0,0.12)',
                    zIndex: 30,
                  }}
                  aria-label="Next Property"
                >
                  ›
                </button>

                {/* Swiper Scroll Track Container */}
                <div
                  ref={sliderRef}
                  className="no-scrollbar"
                  style={{
                    display: 'flex',
                    gap: '2rem',
                    overflowX: 'auto',
                    scrollSnapType: 'x mandatory',
                    scrollBehavior: 'smooth',
                    paddingBottom: '1rem',
                  }}
                >
                  {listOtherProps.map((item: any, idx: number) => {
                    const imageUrl =
                      item.bannerImages && item.bannerImages.length > 0 && item.bannerImages[0]?.url
                        ? item.bannerImages[0].url
                        : 'https://novelsignaturehomes.com/wp-content/uploads/2024/10/Gallery-Image-14.webp'

                    return (
                      <div
                        key={item.id || idx}
                        style={{
                          flex: '0 0 calc(50% - 1rem)',
                          minWidth: '320px',
                          scrollSnapAlign: 'start',
                          backgroundColor: '#ffffff',
                          border: '1px solid #e8e1d6',
                          overflow: 'hidden',
                          position: 'relative',
                        }}
                      >
                        <div style={{ height: '320px', overflow: 'hidden', position: 'relative' }}>
                          <img
                            src={imageUrl}
                            alt={item.name}
                            style={{ width: '100%', height: '100%', objectFit: 'cover' }}
                          />
                        </div>
                        <div
                          style={{
                            padding: '1.5rem 1.25rem',
                            display: 'flex',
                            justifyContent: 'space-between',
                            alignItems: 'flex-end',
                            gap: '1rem',
                          }}
                        >
                          <div>
                            <div
                              style={{
                                fontSize: '14px',
                                fontWeight: '600',
                                color: '#1a1a1a',
                                marginBottom: '0.25rem',
                              }}
                            >
                              {item.name}
                            </div>
                            <div style={{ fontSize: '12px', color: '#737373' }}>{item.address}</div>
                          </div>
                          <div style={{ textAlign: 'right', flexShrink: 0 }}>
                            <Link
                              href={`/properties/${item.slug}`}
                              style={{
                                display: 'inline-block',
                                color: '#1a1a1a',
                                textDecoration: 'none',
                                fontSize: '11px',
                                fontWeight: '600',
                                borderBottom: '1px solid #1a1a1a',
                                paddingBottom: '2px',
                              }}
                            >
                              View Details »
                            </Link>
                          </div>
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>

              <div style={{ textAlign: 'center', marginTop: '2.5rem' }}>
                <Link
                  href="/properties"
                  style={{
                    display: 'inline-block',
                    padding: '0.75rem 2rem',
                    border: '1px solid #1a1a1a',
                    backgroundColor: '#ffffff',
                    color: '#1a1a1a',
                    textDecoration: 'none',
                    fontSize: '13px',
                    fontWeight: '600',
                  }}
                >
                  View All Properties
                </Link>
              </div>
            </div>
          </section>
        </div>
      )}

      {/* Lightbox / Media Modal Overlay */}
      {activeModal && (
        <div
          style={{
            position: 'fixed',
            inset: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.85)',
            backdropFilter: 'blur(8px)',
            zIndex: 9999,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '2rem 1.5rem',
          }}
        >
          {/* Close Button */}
          <button
            onClick={() => setActiveModal(null)}
            style={{
              position: 'absolute',
              top: '24px',
              right: '24px',
              background: 'none',
              border: 'none',
              color: '#ffffff',
              fontSize: '32px',
              cursor: 'pointer',
              zIndex: 10000,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              width: '40px',
              height: '40px',
              borderRadius: '50%',
              backgroundColor: 'rgba(255,255,255,0.1)',
            }}
            aria-label="Close Modal"
          >
            ✕
          </button>

          {/* Modal Content Scroll Area */}
          <div
            style={{
              width: '100%',
              maxWidth: '1200px',
              maxHeight: '85vh',
              overflowY: 'auto',
              display: 'flex',
              flexDirection: 'column',
              position: 'relative',
            }}
            className="no-scrollbar"
          >
            {activeModal === 'photos' && (
              <div>
                {/* Tabs */}
                <div
                  style={{
                    display: 'flex',
                    gap: '2rem',
                    justifyContent: 'center',
                    marginBottom: '2.5rem',
                  }}
                >
                  <button
                    onClick={() => setActivePhotoTab('design')}
                    style={{
                      background: 'none',
                      border: 'none',
                      color: activePhotoTab === 'design' ? '#ffffff' : '#94a3b8',
                      fontSize: '20px',
                      fontWeight: activePhotoTab === 'design' ? '700' : '400',
                      cursor: 'pointer',
                      paddingBottom: '8px',
                      borderBottom: activePhotoTab === 'design' ? '2px solid #dfcbb5' : 'none',
                      transition: 'color 0.2s',
                    }}
                  >
                    Design Images
                  </button>
                  <button
                    onClick={() => setActivePhotoTab('progress')}
                    style={{
                      background: 'none',
                      border: 'none',
                      color: activePhotoTab === 'progress' ? '#ffffff' : '#94a3b8',
                      fontSize: '20px',
                      fontWeight: activePhotoTab === 'progress' ? '700' : '400',
                      cursor: 'pointer',
                      paddingBottom: '8px',
                      borderBottom: activePhotoTab === 'progress' ? '2px solid #dfcbb5' : 'none',
                      transition: 'color 0.2s',
                    }}
                  >
                    Progress Images
                  </button>
                </div>

                {/* Images Grid */}
                {(() => {
                  const rawImages =
                    activePhotoTab === 'design'
                      ? property.allPhotos || []
                      : property.progressPhotos || []

                  const validUrls = rawImages
                    .map(getValidImageUrl)
                    .filter((url: string) => url !== '')

                  const fallbackUrls = [
                    '/media/1001Efront.webp',
                    '/media/Potomac_Exterior_Updated.webp',
                    '/media/034.webp',
                    '/media/PineChase-1024x577.webp',
                    '/media/3dtour.webp',
                  ]

                  const displayUrls =
                    validUrls.length > 0
                      ? validUrls
                      : activePhotoTab === 'design'
                        ? fallbackUrls
                        : []

                  if (displayUrls.length > 0) {
                    return (
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: 'repeat(auto-fill, minmax(320px, 1fr))',
                          gap: '1.5rem',
                          padding: '0.5rem',
                        }}
                      >
                        {displayUrls.map((url: string, idx: number) => (
                          <div
                            key={idx}
                            style={{
                              borderRadius: '8px',
                              overflow: 'hidden',
                              border: '4px solid #ffffff',
                              boxShadow: '0 10px 25px rgba(0,0,0,0.3)',
                              aspectRatio: '16/10',
                              backgroundColor: '#1e293b',
                            }}
                          >
                            <img
                              src={url}
                              alt={`Gallery Image ${idx + 1}`}
                              style={{
                                width: '100%',
                                height: '100%',
                                objectFit: 'cover',
                                display: 'block',
                              }}
                            />
                          </div>
                        ))}
                      </div>
                    )
                  }

                  return (
                    <div
                      style={{
                        textAlign: 'center',
                        color: '#94a3b8',
                        padding: '4rem 1rem',
                        fontSize: '16px',
                      }}
                    >
                      No {activePhotoTab === 'design' ? 'design' : 'progress'} images uploaded for
                      this property yet.
                    </div>
                  )
                })()}
              </div>
            )}

            {activeModal === 'floorplans' && (
              <div>
                <div style={{ textAlign: 'center', marginBottom: '2.5rem' }}>
                  <h3
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '32px',
                      color: '#ffffff',
                      fontWeight: '500',
                      letterSpacing: '1px',
                    }}
                  >
                    Property Floor Plans
                  </h3>
                </div>

                {(() => {
                  const hasFloorPlans = property.floorPlans && property.floorPlans.length > 0
                  const hasFloorPlanPhotos =
                    property.allFloorPlanPhotos && property.allFloorPlanPhotos.length > 0

                  if (hasFloorPlans) {
                    return (
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))',
                          gap: '2rem',
                          justifyContent: 'center',
                          padding: '0.5rem',
                        }}
                      >
                        {property.floorPlans.map((item: any, idx: number) => {
                          const url =
                            typeof item.image === 'object' && item.image?.url ? item.image.url : ''
                          if (!url) return null

                          const label = item.floorName || `Floor Plan ${idx + 1}`
                          const areaText = item.areaSize ? `TOTAL AREA: ${item.areaSize}` : ''

                          return (
                            <div
                              key={idx}
                              style={{
                                backgroundColor: '#1e293b',
                                border: '1px solid rgba(255,255,255,0.08)',
                                padding: '1.5rem',
                                borderRadius: '12px',
                                display: 'flex',
                                flexDirection: 'column',
                                alignItems: 'center',
                                boxShadow: '0 8px 30px rgba(0,0,0,0.4)',
                              }}
                            >
                              <div
                                style={{
                                  width: '100%',
                                  fontSize: '14px',
                                  color: '#dfcbb5',
                                  fontWeight: '600',
                                  textTransform: 'uppercase',
                                  letterSpacing: '1px',
                                  marginBottom: '0.5rem',
                                  borderBottom: '1px solid rgba(255,255,255,0.08)',
                                  paddingBottom: '0.5rem',
                                }}
                              >
                                {label}
                              </div>
                              {areaText && (
                                <div
                                  style={{
                                    width: '100%',
                                    fontSize: '11px',
                                    color: '#cbd5e1',
                                    letterSpacing: '0.5px',
                                    marginBottom: '1rem',
                                    marginTop: '-0.25rem',
                                  }}
                                >
                                  {areaText}
                                </div>
                              )}
                              <div
                                style={{
                                  width: '100%',
                                  height: '240px',
                                  display: 'flex',
                                  alignItems: 'center',
                                  justifyContent: 'center',
                                  overflow: 'hidden',
                                  backgroundColor: '#0f172a',
                                  borderRadius: '6px',
                                  marginBottom: '1.25rem',
                                }}
                              >
                                <img
                                  src={url}
                                  alt={label}
                                  style={{
                                    maxWidth: '100%',
                                    maxHeight: '100%',
                                    objectFit: 'contain',
                                    display: 'block',
                                  }}
                                />
                              </div>
                              <a
                                href={url}
                                target="_blank"
                                rel="noopener noreferrer"
                                style={{
                                  color: '#ffffff',
                                  textDecoration: 'none',
                                  fontSize: '12px',
                                  fontWeight: '600',
                                  border: '1px solid rgba(255,255,255,0.2)',
                                  padding: '0.5rem 1.25rem',
                                  borderRadius: '4px',
                                  transition: 'background 0.2s',
                                  backgroundColor: 'rgba(255,255,255,0.05)',
                                }}
                                onMouseEnter={(e) => {
                                  e.currentTarget.style.backgroundColor = 'rgba(255,255,255,0.1)'
                                }}
                                onMouseLeave={(e) => {
                                  e.currentTarget.style.backgroundColor = 'rgba(255,255,255,0.05)'
                                }}
                              >
                                View Full Size
                              </a>
                            </div>
                          )
                        })}
                      </div>
                    )
                  }

                  if (hasFloorPlanPhotos) {
                    return (
                      <div
                        style={{
                          display: 'grid',
                          gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))',
                          gap: '2rem',
                          justifyContent: 'center',
                          padding: '0.5rem',
                        }}
                      >
                        {property.allFloorPlanPhotos.map((image: any, idx: number) => {
                          const url = typeof image === 'object' && image?.url ? image.url : ''
                          if (!url) return null

                          const labels = ['Garage Floor', 'Floor 1', 'Floor 2', 'Floor 3']
                          const label = labels[idx] || `Floor Plan ${idx + 1}`
                          const areaText =
                            idx === 0
                              ? 'TOTAL AREA: 440 SQFT'
                              : idx === 1
                                ? 'TOTAL AREA: 3,194 SQFT'
                                : idx === 2
                                  ? 'TOTAL AREA: 1,732 SQFT'
                                  : ''

                          return (
                            <div
                              key={idx}
                              style={{
                                backgroundColor: '#1e293b',
                                border: '1px solid rgba(255,255,255,0.08)',
                                padding: '1.5rem',
                                borderRadius: '12px',
                                display: 'flex',
                                flexDirection: 'column',
                                alignItems: 'center',
                                boxShadow: '0 8px 30px rgba(0,0,0,0.4)',
                              }}
                            >
                              <div
                                style={{
                                  width: '100%',
                                  fontSize: '14px',
                                  color: '#dfcbb5',
                                  fontWeight: '600',
                                  textTransform: 'uppercase',
                                  letterSpacing: '1px',
                                  marginBottom: '0.5rem',
                                  borderBottom: '1px solid rgba(255,255,255,0.08)',
                                  paddingBottom: '0.5rem',
                                }}
                              >
                                {label}
                              </div>
                              {areaText && (
                                <div
                                  style={{
                                    width: '100%',
                                    fontSize: '11px',
                                    color: '#cbd5e1',
                                    letterSpacing: '0.5px',
                                    marginBottom: '1rem',
                                    marginTop: '-0.25rem',
                                  }}
                                >
                                  {areaText}
                                </div>
                              )}
                              <div
                                style={{
                                  width: '100%',
                                  height: '240px',
                                  display: 'flex',
                                  alignItems: 'center',
                                  justifyContent: 'center',
                                  overflow: 'hidden',
                                  backgroundColor: '#0f172a',
                                  borderRadius: '6px',
                                  marginBottom: '1.25rem',
                                }}
                              >
                                <img
                                  src={url}
                                  alt={label}
                                  style={{
                                    maxWidth: '100%',
                                    maxHeight: '100%',
                                    objectFit: 'contain',
                                    display: 'block',
                                  }}
                                />
                              </div>
                              <a
                                href={url}
                                target="_blank"
                                rel="noopener noreferrer"
                                style={{
                                  color: '#ffffff',
                                  textDecoration: 'none',
                                  fontSize: '12px',
                                  fontWeight: '600',
                                  border: '1px solid rgba(255,255,255,0.2)',
                                  padding: '0.5rem 1.25rem',
                                  borderRadius: '4px',
                                  transition: 'background 0.2s',
                                  backgroundColor: 'rgba(255,255,255,0.05)',
                                }}
                                onMouseEnter={(e) => {
                                  e.currentTarget.style.backgroundColor = 'rgba(255,255,255,0.1)'
                                }}
                                onMouseLeave={(e) => {
                                  e.currentTarget.style.backgroundColor = 'rgba(255,255,255,0.05)'
                                }}
                              >
                                View Full Size
                              </a>
                            </div>
                          )
                        })}
                      </div>
                    )
                  }

                  return (
                    <div
                      style={{
                        textAlign: 'center',
                        color: '#94a3b8',
                        padding: '4rem 1rem',
                        fontSize: '16px',
                      }}
                    >
                      No floor plans uploaded for this property yet.
                    </div>
                  )
                })()}
              </div>
            )}

            {activeModal === 'video' && (
              <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                <div style={{ textAlign: 'center', marginBottom: '2rem' }}>
                  <h3
                    style={{
                      fontFamily: "'Cormorant Garamond', serif",
                      fontSize: '32px',
                      color: '#ffffff',
                      fontWeight: '500',
                      letterSpacing: '1px',
                    }}
                  >
                    Property Video Tour
                  </h3>
                </div>

                <div
                  style={{
                    width: '100%',
                    maxWidth: '850px',
                    aspectRatio: '16/9',
                    backgroundColor: '#000000',
                    borderRadius: '12px',
                    overflow: 'hidden',
                    boxShadow: '0 25px 60px rgba(0,0,0,0.6)',
                    border: '1px solid rgba(255,255,255,0.1)',
                  }}
                >
                  {property.video?.videoType === 'youtube' && youtubeEmbedUrl ? (
                    <iframe
                      src={youtubeEmbedUrl}
                      title="Property Video Tour"
                      style={{ width: '100%', height: '100%', border: 'none' }}
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                    />
                  ) : property.video?.videoType === 'file' && property.video?.videoFile?.url ? (
                    <video
                      src={property.video.videoFile.url}
                      controls
                      autoPlay
                      style={{ width: '100%', height: '100%', objectFit: 'contain' }}
                    />
                  ) : (
                    <div
                      style={{
                        height: '100%',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        color: '#94a3b8',
                      }}
                    >
                      No video tour available.
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}

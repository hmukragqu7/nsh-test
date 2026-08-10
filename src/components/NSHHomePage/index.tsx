'use client'

import React, { useState, useEffect, useRef } from 'react'
import Link from 'next/link'

/* ──────────────────────────────────────────────
   FEATURED PROPERTY SLIDER
   ────────────────────────────────────────────── */
const featuredProperties = [
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
]

/* ──────────────────────────────────────────────
   LISTINGS ROW
   ────────────────────────────────────────────── */
const listings = [
  {
    image: '/media/amh-banner1-ezgif.com-resize-1024x577.webp',
    status: 'for sale',
    title: '3224 Amherst Avenue, Dallas, Texas, 75225',
    details: '5 BD | 7 BA | AC Area: 5,897',
    href: '/properties/3224-amherst-avenue-dallas-tx-75225',
  },
  {
    image: '/media/034.webp',
    status: 'for sale',
    title: '4927 Heatherglen Drive, Houston, Texas, 77096',
    details: '4 BD | AC Area: 5,366 Sqft',
    href: '/properties/4927-heatherglen-drive-houston-texas-77096',
  },
  {
    image: '/media/PineChase-1024x577.webp',
    status: 'sold',
    title: '1311 Pine Chase Drive, Houston, TX 77055',
    details: '6 BD | 9 BA | AC Area: 6,811',
    href: '/properties/1311-pine-chase-dr-houston',
  },
  {
    image: '/media/1001Efront.webp',
    status: 'for sale',
    title: '1001 E, Houston, TX 77002',
    details: '4 BD | 4.5 BA | AC Area: 4,100',
    href: '/properties/1001-e-houston-tx-77002',
  },
]

/* ──────────────────────────────────────────────
   WHY CHOOSE US DATA
   ────────────────────────────────────────────── */
const whyChooseUs = [
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
]

interface NSHHomePageProps {
  pageData?: any
  initialListings?: Array<{
    image: string
    status: string
    title: string
    details: string
    href: string
  }>
}

export default function NSHHomePage({ pageData, initialListings }: NSHHomePageProps) {
  const listingsData = initialListings && initialListings.length > 0 ? initialListings : listings
  const [slide, setSlide] = useState(0)
  const [isDragging, setIsDragging] = useState(false)
  const [formData, setFormData] = useState({ name: '', phone: '', email: '', message: '' })
  const [submitted, setSubmitted] = useState(false)
  const listingsRef = useRef<HTMLDivElement>(null)
  const dragStartX = useRef(0)
  const scrollStartX = useRef(0)

  // Dynamic homepage fields with fallbacks
  const heroTitle = pageData?.homeHero?.title || 'Luxury Redefined'
  const heroDesc =
    pageData?.homeHero?.description ||
    'Experience unparalleled luxury living with our meticulously crafted high-end homes'
  const heroVideo = pageData?.homeHero?.videoUrl || '/media/WEBSITE-1.mov'
  const heroBtnText = pageData?.homeHero?.buttonText || 'View All Properties'
  const heroBtnLink = pageData?.homeHero?.buttonLink || '/properties'

  const featuredPropertiesData =
    pageData?.featuredPropertiesOverride && pageData.featuredPropertiesOverride.length > 0
      ? pageData.featuredPropertiesOverride
      : featuredProperties

  const timelessTitle = pageData?.timelessComfort?.title || 'Timeless Comfort In Every Detail'
  const timelessDesc =
    pageData?.timelessComfort?.description ||
    'We believe in creating more than just houses; we create homes. Meticulously designed to bring you comfort, beauty and a sense of peace. Welcome to a home that truly understands you.'
  const timelessBtnText = pageData?.timelessComfort?.buttonText || 'About Us'
  const timelessBtnLink = pageData?.timelessComfort?.buttonLink || '/about'

  const whyChooseUsData =
    pageData?.whyChooseUs && pageData.whyChooseUs.length > 0 ? pageData.whyChooseUs : whyChooseUs

  const vrTitle = pageData?.vrTour?.title || 'Experience Your Future Home'
  const vrDesc =
    pageData?.vrTour?.description ||
    "Immerse yourself in every corner of your home with our seamlessly integrated cutting-edge technology, like 3D virtual tours and walkable plans, to help you visualize your dream luxury home even before it's built."
  const vrBannerImg = pageData?.vrTour?.bannerImage || '/media/3dtour.webp'
  const vrBtnText = pageData?.vrTour?.buttonText || 'Take a Virtual Tour'
  const vrBtnLink = pageData?.vrTour?.buttonLink || '/properties'

  const conciergeTitle = pageData?.concierge?.title || 'Our Concierge Services'
  const conciergeDesc =
    pageData?.concierge?.description ||
    "We're here for you long after you get the keys. From Mortgage Assistance and Handyman Service to Transfer utilities—and so much more—you can count on our trusted network to make settling into your new home effortless."
  const conciergeImg = pageData?.concierge?.image || '/media/concierge-services.webp'
  const conciergeBtnText = pageData?.concierge?.buttonText || 'Learn More'
  const conciergeBtnLink = pageData?.concierge?.buttonLink || '/concierge'

  const newestTitle = pageData?.newestResidences?.title || 'Explore Our Newest Residences'
  const newestDesc =
    pageData?.newestResidences?.description ||
    'Explore refined architecture and design artistry in our newest homes, built to inspire elegant everyday living.'
  const newestVideoUrl =
    pageData?.newestResidences?.youtubeUrl || 'https://www.youtube.com/embed/iDv2I89i8QY?rel=0'
  const newestSubscribeLink =
    pageData?.newestResidences?.subscribeLink ||
    'https://www.youtube.com/@NovelSignatureHomes/videos'

  const contactHeadingText = pageData?.homeContact?.heading

  const renderContactHeading = () => {
    if (!contactHeadingText) {
      return (
        <>
          LET'S FIND YOUR
          <span className="accent">DREAM HOME</span>
          TOGETHER
        </>
      )
    }
    if (contactHeadingText.toUpperCase().includes('DREAM HOME')) {
      const parts = contactHeadingText.split(/(DREAM HOME)/i)
      return (
        <>
          {parts[0]}
          <span className="accent">{parts[1]}</span>
          {parts[2]}
        </>
      )
    }
    return contactHeadingText
  }

  // Auto-advance featured slider
  useEffect(() => {
    const timer = setInterval(() => {
      setSlide((s) => (s + 1) % featuredPropertiesData.length)
    }, 6000)
    return () => clearInterval(timer)
  }, [featuredPropertiesData.length])

  // Listings horizontal drag scroll
  const onMouseDown = (e: React.MouseEvent) => {
    setIsDragging(true)
    dragStartX.current = e.clientX
    scrollStartX.current = listingsRef.current?.scrollLeft ?? 0
  }
  const onMouseMove = (e: React.MouseEvent) => {
    if (!isDragging || !listingsRef.current) return
    listingsRef.current.scrollLeft = scrollStartX.current - (e.clientX - dragStartX.current)
  }
  const onMouseUp = () => setIsDragging(false)

  return (
    <>
      <style>{`
        /* ── Global NSH tokens ── */
        :root {
          --nsh-green: #1d3533;
          --nsh-gold: #dfcbb5;
          --nsh-accent: #8A561F;
          --nsh-dark: #1a1a1a;
          --nsh-white: #fefefe;
          --nsh-cream: #e8e1d6;
          --nsh-light: #F0F5FA;
          --font-serif: 'Cormorant Garamond', Georgia, serif;
          --font-sans: 'Montserrat', sans-serif;
        }

        /* ── Hero ── */
        .nsh-hero {
          position: relative;
          min-height: 100vh;
          width: 100%;
          overflow: hidden;
          display: flex;
          align-items: flex-start;
          justify-content: flex-start;
        }
        .nsh-hero-video {
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          z-index: 0;
        }
        .nsh-hero-overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(130deg, rgba(0,0,0,0.6) 0%, rgba(0,0,0,0.25) 80%);
          z-index: 1;
        }
        .nsh-hero-content {
          position: relative;
          z-index: 2;
          padding: 35vh 75px 80px;
          max-width: 720px;
        }
        .nsh-hero-title {
          font-family: var(--font-serif);
          font-size: clamp(52px, 3vw, 90px);
          font-weight: 400;
          color: var(--nsh-white);
          line-height: 1.05;
          letter-spacing: 3px;
          margin: 0 0 1.25rem;
          text-transform: uppercase;
        }
        .nsh-hero-desc {
          font-family: var(--font-sans);
          font-size: 18px;
          font-weight: 400;
          color: var(--nsh-white);
          line-height: 1.8;
          margin: 0 0 2.5rem;
          max-width: 520px;
          opacity: 0.92;
        }
        .nsh-btn-outline {
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
          font-family: var(--font-sans);
          font-size: 14px;
          font-weight: 500;
          letter-spacing: 1.5px;
          text-transform: uppercase;
          color: var(--nsh-white);
          border: 1px solid var(--nsh-white);
          padding: 14px 28px;
          text-decoration: none;
          transition: background-color 0.3s, color 0.3s;
          cursor: pointer;
          background: transparent;
        }
        .nsh-btn-outline:hover {
          background: var(--nsh-white);
          color: var(--nsh-dark);
        }

        /* ── Section common ── */
        .nsh-section {
          padding: 90px 75px;
        }
        .nsh-section-inner {
          max-width: 1400px;
          margin: 0 auto;
        }

        /* ── Section headings ── */
        .nsh-section-title {
          font-family: var(--font-serif);
          font-size: clamp(36px, 4vw, 62px);
          font-weight: 400;
          color: var(--nsh-dark);
          line-height: 1.2;
          margin: 0 0 0.5rem;
        }
        .nsh-section-title .accent {
          color: var(--nsh-accent);
        }
        .nsh-gradient-rule {
          border: none;
          border-top: 1px solid;
          border-image: linear-gradient(90deg, #000000, #fefefe) 1;
          margin: 0 0 3rem;
          width: 100%;
        }
        .nsh-gradient-rule-gold {
          border: none;
          border-top: 1px solid;
          border-image: linear-gradient(90deg, #fefefe 0%, #8A561F 50%, #fefefe 100%) 1;
          margin: 0 0 3rem;
        }

        /* ── Featured Listings Draggable Track ── */
        .nsh-slider-section {
          padding: 70px 75px;
          background: #f9f6f1;
        }
        .nsh-slider-wrap {
          position: relative;
          width: 100%;
          height: 90vh;
          min-height: 500px;
          overflow: hidden;
        }
        .nsh-slide {
          position: absolute;
          inset: 0;
          background-size: cover;
          background-position: center 38%;
          transition: opacity 0.9s ease;
          opacity: 0;
        }
        .nsh-slide.active {
          opacity: 1;
        }
        .nsh-slide-overlay {
          position: absolute;
          inset: 0;
          background: linear-gradient(180deg, rgba(0,0,0,0.0) 30%, rgba(0,0,0,0.75) 100%);
        }
        .nsh-slide-info {
          position: absolute;
          bottom: 0;
          left: 0;
          right: 0;
          padding: 24px 60px;
          display: flex;
          align-items: center;
          justify-content: space-between;
          background-color: rgba(0, 0, 0, 0.45);
          backdrop-filter: blur(8px);
          -webkit-backdrop-filter: blur(8px);
        }
        .nsh-slide-name {
          font-family: var(--font-serif);
          font-size: clamp(32px, 3.5vw, 42px);
          font-weight: 400;
          color: var(--nsh-white);
          line-height: 1;
          margin: 0;
          border-bottom: 1px solid rgba(255, 255, 255, 0.4);
          padding-bottom: 4px;
          display: inline-block;
        }
        .nsh-slide-details {
          font-family: var(--font-sans);
          font-size: 14px;
          color: var(--nsh-white);
          opacity: 0.95;
          margin: 0;
          letter-spacing: 0.5px;
        }
        .nsh-slide-cta {
          display: flex;
          align-items: center;
          gap: 0.75rem;
          font-family: var(--font-sans);
          font-size: 14px;
          font-weight: 500;
          color: var(--nsh-white);
          text-decoration: none;
          letter-spacing: 0.5px;
          transition: color 0.2s;
          white-space: nowrap;
        }
        .nsh-slide-cta:hover {
          color: var(--nsh-gold);
        }
        .nsh-slide-cta svg {
          width: 22px;
          height: 22px;
        }

        /* ── Timeless Comfort ── */
        .nsh-timeless {
          background: #ffffff;
          padding: 80px 75px;
        }
        .nsh-timeless-inner {
          max-width: 1440px;
          margin: 0 auto;
          text-align: left;
        }
        .nsh-timeless-inner .nsh-section-title {
          font-family: var(--font-serif);
          font-size: clamp(32px, 4vw, 44px);
          color: var(--nsh-dark);
          margin-bottom: 0.5rem;
          text-transform: none;
        }
        .nsh-timeless-hr {
          border: none;
          border-top: 1px solid #e8e1d6;
          margin: 1rem 0 2rem;
          width: 100%;
        }
        .nsh-timeless-text {
          font-family: var(--font-sans);
          font-size: 13px;
          line-height: 1.8;
          color: #555555;
          margin: 0 0 2rem;
          max-width: 900px;
        }
        .nsh-btn-outline-dark {
          display: inline-flex;
          align-items: center;
          font-family: var(--font-sans);
          font-size: 12px;
          font-weight: 500;
          letter-spacing: 0.5px;
          text-transform: none;
          color: #1a1a1a;
          background: transparent;
          border: 1px solid #1a1a1a;
          padding: 10px 24px;
          text-decoration: none;
          transition: background-color 0.2s, color 0.2s;
          cursor: pointer;
        }
        .nsh-btn-outline-dark:hover {
          background-color: #1a1a1a;
          color: #ffffff;
        }

        /* ── Why Choose Us ── */
        .nsh-why {
          position: relative;
          padding: 80px 75px;
          background: #111111;
          color: #ffffff;
          overflow: hidden;
        }
        .nsh-why::before {
          content: "";
          position: absolute;
          inset: 0;
          background-image: url("/media/topography.svg");
          background-size: cover;
          background-position: center;
          opacity: 0.08;
          filter: invert(1);
          pointer-events: none;
        }
        .nsh-why .nsh-section-inner {
          position: relative;
          z-index: 2;
          max-width: 1440px;
          margin: 0 auto;
        }
        .nsh-why .nsh-section-title {
          font-family: var(--font-serif);
          font-size: clamp(32px, 4vw, 44px);
          color: #ffffff;
          margin-bottom: 0.5rem;
          text-align: left;
        }
        .nsh-why-hr {
          border: none;
          border-top: 1px solid rgba(255, 255, 255, 0.15);
          margin: 1rem 0 3rem;
          width: 100%;
        }
        .nsh-why-grid {
          position: relative;
          z-index: 2;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 4rem;
          max-width: 1440px;
          margin: 0 auto;
        }
        .nsh-why-item {
          position: relative;
          padding-top: 0;
        }
        .nsh-why-label {
          font-family: var(--font-sans);
          font-size: 11px;
          font-weight: 600;
          letter-spacing: 2px;
          text-transform: uppercase;
          color: #ffffff;
          margin: 0 0 0.5rem;
          display: block;
          opacity: 0.9;
        }
        .nsh-why-heading {
          font-family: var(--font-serif);
          font-size: 22px;
          font-weight: 400;
          color: var(--nsh-gold);
          margin: 0 0 1rem;
          line-height: 1.3;
          text-transform: none;
          display: inline-block;
          border-bottom: 1px solid rgba(223, 203, 181, 0.45);
          padding-bottom: 6px;
        }
        .nsh-why-text {
          font-family: var(--font-sans);
          font-size: 13px;
          line-height: 1.8;
          color: rgba(255, 255, 255, 0.75);
          margin: 0;
        }

        /* ── VR Tour ── */
        .nsh-vr {
          background: #ffffff;
          padding: 80px 75px;
        }
        .nsh-vr-inner {
          max-width: 1440px;
          margin: 0 auto;
          text-align: left;
        }
        .nsh-vr-title {
          font-family: var(--font-serif);
          font-size: clamp(32px, 4vw, 44px);
          color: var(--nsh-dark);
          margin-bottom: 0.5rem;
          text-align: left;
        }
        .nsh-vr-title .accent {
          color: var(--nsh-accent);
        }
        .nsh-vr-hr {
          border: none;
          border-top: 1px solid #e8e1d6;
          margin: 1rem 0 2rem;
          width: 100%;
        }
        .nsh-vr-text {
          font-family: var(--font-sans);
          font-size: 13px;
          line-height: 1.8;
          color: #555555;
          margin: 0 0 2.5rem;
          max-width: 900px;
          text-align: left;
        }
        .nsh-vr-banner {
          position: relative;
          width: 100%;
          height: 300px;
          background-image: url("/media/3dtour.webp");
          background-size: cover;
          background-position: center;
          display: flex;
          align-items: center;
          justify-content: center;
          overflow: hidden;
          margin-top: 2rem;
        }
        .nsh-vr-btn {
          display: inline-flex;
          align-items: center;
          gap: 0.75rem;
          font-family: var(--font-sans);
          font-size: 12px;
          font-weight: 500;
          letter-spacing: 0.5px;
          color: #ffffff;
          background: rgba(0, 0, 0, 0.45);
          border: 1px solid rgba(255, 255, 255, 0.85);
          padding: 12px 28px;
          text-decoration: none;
          transition: background-color 0.2s, border-color 0.2s;
          cursor: pointer;
          backdrop-filter: blur(4px);
          -webkit-backdrop-filter: blur(4px);
        }
        .nsh-vr-btn:hover {
          background-color: rgba(0, 0, 0, 0.65);
          border-color: #ffffff;
        }
        @media (max-width: 768px) {
          .nsh-vr-banner {
            height: 250px;
          }
        }

        /* ── Our Listings ── */
        .nsh-listings {
          position: relative;
          padding: 90px 75px;
          background: #fafaf8 url("/media/topography.svg") repeat;
          background-size: cover;
          background-position: center;
        }
        .nsh-listings-scroll-wrap {
          overflow: hidden;
          position: relative;
        }
        .nsh-listings-track {
          display: flex;
          gap: 2rem;
          overflow-x: auto;
          scroll-behavior: smooth;
          scrollbar-width: none;
          cursor: grab;
          -webkit-user-select: none;
          user-select: none;
        }
        .nsh-listings-track:active { cursor: grabbing; }
        .nsh-listings-track::-webkit-scrollbar { display: none; }
        .nsh-listing-card {
          flex: 0 0 calc(50% - 1rem);
          min-width: 320px;
          position: relative;
          overflow: hidden;
        }
        .nsh-listing-img-container {
          overflow: hidden;
          position: relative;
        }
        .nsh-listing-img {
          width: 100%;
          aspect-ratio: 16/10;
          object-fit: cover;
          display: block;
          transition: transform 0.5s ease;
        }
        .nsh-listing-card:hover .nsh-listing-img { transform: scale(1.04); }
        .nsh-listing-status {
          position: absolute;
          top: 1rem;
          right: 1rem;
          background: rgba(17, 28, 26, 0.85);
          color: #ffffff;
          font-family: var(--font-sans);
          font-size: 10px;
          font-weight: 600;
          letter-spacing: 1.5px;
          text-transform: uppercase;
          padding: 6px 12px;
          display: flex;
          align-items: center;
          gap: 8px;
          border-radius: 2px;
        }
        .nsh-status-dot {
          width: 8px;
          height: 8px;
          border-radius: 50%;
          display: block;
        }
        .nsh-status-dot.for-sale {
          background: #00e676;
        }
        .nsh-status-dot.sold {
          background: #ff3b30;
        }
        .nsh-status-dot.under-contract {
          background: #ffcc00;
        }
        .nsh-listing-body {
          padding: 1.25rem 0;
          display: flex;
          flex-direction: column;
          gap: 0.5rem;
        }
        .nsh-listing-info-row {
          display: flex;
          justify-content: space-between;
          align-items: center;
          gap: 1rem;
        }
        .nsh-listing-title {
          font-family: var(--font-sans);
          font-size: 14px;
          font-weight: 600;
          color: var(--nsh-dark);
          margin: 0;
          line-height: 1.3;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
          flex: 1;
        }
        .nsh-listing-details {
          font-family: var(--font-sans);
          font-size: 13px;
          color: #666;
          margin: 0;
          white-space: nowrap;
        }
        .nsh-listing-link-row {
          display: flex;
          justify-content: flex-end;
        }
        .nsh-listing-link {
          display: inline-flex;
          align-items: center;
          gap: 0.25rem;
          font-family: var(--font-sans);
          font-size: 13px;
          font-weight: 500;
          color: var(--nsh-accent);
          text-decoration: none;
          transition: gap 0.2s, color 0.2s;
        }
        .nsh-listing-link:hover {
          gap: 0.45rem;
          color: var(--nsh-gold);
        }

        /* ── Concierge ── */
        .nsh-concierge {
          background: #1a1a1a;
          padding: 0;
          width: 100%;
        }
        .nsh-concierge-inner {
          max-width: 1440px;
          margin: 0 auto;
          display: flex;
          min-height: 550px;
          width: 100%;
        }
        @media (max-width: 900px) {
          .nsh-concierge-inner {
            flex-direction: column;
          }
        }
        .nsh-concierge-left {
          flex: 1;
          background: #1a1a1a;
          color: #ffffff;
          padding: 80px 75px;
          display: flex;
          flex-direction: column;
          justify-content: center;
        }
        .nsh-concierge-right {
          flex: 1;
          background-image: url("/media/concierge-services.webp");
          background-size: cover;
          background-position: center;
          min-height: 400px;
        }
        .nsh-concierge-title {
          font-family: var(--font-serif);
          font-size: clamp(32px, 4vw, 44px);
          color: #ffffff;
          margin: 0 0 0.5rem;
          text-align: left;
        }
        .nsh-concierge-hr {
          border: none;
          border-top: 1px solid rgba(255, 255, 255, 0.15);
          margin: 1rem 0 2rem;
          width: 100%;
        }
        .nsh-concierge-text {
          font-family: var(--font-sans);
          font-size: 13px;
          line-height: 1.85;
          color: rgba(255, 255, 255, 0.8);
          margin: 0 0 2.5rem;
          max-width: 550px;
          text-align: left;
        }
        .nsh-btn-outline-white {
          display: inline-flex;
          align-items: center;
          justify-content: center;
          font-family: var(--font-sans);
          font-size: 12px;
          font-weight: 500;
          letter-spacing: 0.5px;
          text-transform: none;
          color: #ffffff;
          background: transparent;
          border: 1px solid rgba(255, 255, 255, 0.7);
          padding: 10px 24px;
          text-decoration: none;
          transition: background-color 0.2s, color 0.2s;
          cursor: pointer;
          align-self: flex-start;
        }
        .nsh-btn-outline-white:hover {
          background-color: #ffffff;
          color: #1a1a1a;
          border-color: #ffffff;
        }
        .nsh-btn-outline-gold {
          display: inline-flex;
          align-items: center;
          gap: 0.5rem;
          font-family: var(--font-sans);
          font-size: 13px;
          font-weight: 500;
          letter-spacing: 1.5px;
          text-transform: uppercase;
          color: var(--nsh-gold);
          border: 1px solid var(--nsh-gold);
          padding: 14px 32px;
          text-decoration: none;
          transition: background 0.3s, color 0.3s;
          background: transparent;
        }
        .nsh-btn-outline-gold:hover {
          background: var(--nsh-gold);
          color: var(--nsh-dark);
        }

        /* ── Newest Residences Video Section ── */
        .nsh-newest {
          background: #ffffff;
          padding: 90px 75px;
        }
        .nsh-newest-title {
          font-family: var(--font-serif);
          font-size: clamp(32px, 4vw, 44px);
          color: var(--nsh-dark);
          margin-bottom: 0.5rem;
          text-align: left;
        }
        .nsh-newest-text {
          font-family: var(--font-sans);
          font-size: 13px;
          line-height: 1.8;
          color: #555555;
          margin: 1.5rem 0 3rem;
          text-align: left;
        }
        .nsh-newest-video-wrap {
          max-width: 1000px;
          margin: 0 auto;
          aspect-ratio: 16/9;
          position: relative;
          width: 100%;
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .nsh-newest-iframe {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          border: none;
        }

        /* ── Contact Section ── */
        .nsh-contact {
          position: relative;
          padding: 100px 75px;
          background: #fafaf8 url("/media/topography.svg") repeat;
          background-size: cover;
          background-position: center;
        }
        .nsh-contact-grid {
          display: grid;
          grid-template-columns: 1.1fr 0.9fr;
          gap: 5rem;
          max-width: 1440px;
          margin: 0 auto;
          align-items: center;
        }
        .nsh-contact-left {
          display: flex;
          flex-direction: column;
        }
        .nsh-contact-title {
          font-family: var(--font-serif);
          font-size: clamp(34px, 4.5vw, 48px);
          font-weight: 400;
          line-height: 1.3;
          color: var(--nsh-dark);
          letter-spacing: 1px;
          text-transform: uppercase;
          text-align: left;
        }
        .nsh-contact-title span.accent {
          color: var(--nsh-accent);
          display: block;
        }
        .nsh-contact-right {
          background: transparent;
        }
        .nsh-contact-form {
          display: flex;
          flex-direction: column;
          gap: 1.25rem;
        }
        .nsh-form-group {
          display: flex;
          flex-direction: column;
          align-items: flex-start;
          gap: 0.35rem;
        }
        .nsh-form-label {
          font-family: var(--font-sans);
          font-size: 13px;
          color: #1a1a1a;
          font-weight: 500;
        }
        .nsh-form-label .required {
          color: #ff3b30;
          margin-left: 2px;
        }
        .nsh-form-input, .nsh-form-textarea {
          font-family: var(--font-sans);
          font-size: 14px;
          color: #1a1a1a;
          background-color: #eaeae7;
          border: 1px solid transparent;
          padding: 10px 14px;
          outline: none;
          transition: border-color 0.2s;
          width: 100%;
        }
        .nsh-form-input:focus, .nsh-form-textarea:focus {
          border-color: var(--nsh-accent);
        }
        .nsh-form-textarea {
          resize: vertical;
          min-height: 100px;
        }
        .nsh-form-submit {
          font-family: var(--font-sans);
          font-size: 12px;
          font-weight: 600;
          letter-spacing: 1px;
          color: #ffffff;
          background-color: #000000;
          border: 1px solid #000000;
          padding: 12px 28px;
          cursor: pointer;
          transition: background-color 0.2s, color 0.2s;
          align-self: flex-start;
          text-transform: uppercase;
        }
        .nsh-form-submit:hover {
          background-color: transparent;
          color: #000000;
        }
        .nsh-contact-success {
          font-family: var(--font-sans);
          font-size: 14px;
          color: var(--nsh-accent);
          font-weight: 500;
          padding: 15px;
          background: rgba(255,255,255,0.9);
          border: 1px solid var(--nsh-accent);
          text-align: center;
          width: 100%;
        }

        /* ── Responsive ── */
        @media (max-width: 1024px) {
          .nsh-hero-content { padding: 35vh 40px 60px; }
          .nsh-section, .nsh-slider-section, .nsh-timeless, .nsh-why, .nsh-vr, .nsh-listings, .nsh-concierge, .nsh-newest, .nsh-contact {
            padding-left: 40px;
            padding-right: 40px;
          }
          .nsh-why-grid { grid-template-columns: repeat(2, 1fr); }
          .nsh-slide-info { padding: 30px 40px; }
          .nsh-contact-grid { gap: 3rem; }
        }
        @media (max-width: 768px) {
          .nsh-hero-content { padding: 35vh 24px 40px; }
          .nsh-section, .nsh-slider-section, .nsh-timeless, .nsh-why, .nsh-vr, .nsh-listings, .nsh-concierge, .nsh-newest, .nsh-contact {
            padding-left: 24px;
            padding-right: 24px;
          }
          .nsh-why-grid { grid-template-columns: 1fr; }
          .nsh-listing-card { min-width: 280px; flex: 0 0 85%; }
          .nsh-slide-info { padding: 20px 24px; flex-direction: column; align-items: flex-start; gap: 1rem; }
          .nsh-slide-name { font-size: 36px; }
          .nsh-contact-grid { grid-template-columns: 1fr; gap: 2.5rem; }
        }
      `}</style>

      {/* ─── HERO SECTION ─── */}
      <section className="home-hero nsh-hero">
        <video
          className="nsh-hero-video"
          autoPlay
          loop
          muted
          playsInline
          poster="/media/Potomac_Exterior_Updated.webp"
        >
          <source src={heroVideo} type="video/mp4" />
        </video>
        <div className="nsh-hero-overlay" />
        <div className="nsh-hero-content">
          <h1 className="nsh-hero-title">{heroTitle}</h1>
          <p className="nsh-hero-desc">{heroDesc}</p>
          <Link href={heroBtnLink} className="nsh-btn-outline">
            {heroBtnText}
            <svg
              width="16"
              height="16"
              fill="none"
              stroke="currentColor"
              strokeWidth="1.5"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"
              />
            </svg>
          </Link>
        </div>
      </section>

      {/* ─── FEATURED LISTINGS ─── */}
      <section className="home-featured-slider nsh-slider-section">
        <div className="max-width nsh-section-inner">
          <h2 className="nsh-section-title">
            Our <span className="accent">featured</span> listings
          </h2>
          <hr className="nsh-gradient-rule" />
        </div>

        <div className="max-width nsh-section-inner">
          <div className="nsh-slider-wrap">
            {featuredPropertiesData.map((prop: any, i: number) => (
              <div
                key={i}
                className={`nsh-slide${slide === i ? ' active' : ''}`}
                style={{ backgroundImage: `url(${prop.image})` }}
              >
                <div className="nsh-slide-overlay" />
                <div className="nsh-slide-info">
                  <h3 className="nsh-slide-name">{prop.name}</h3>
                  <p className="nsh-slide-details">{prop.details}</p>
                  <Link href={prop.href || '/properties'} className="nsh-slide-cta">
                    <span>View property</span>
                    <svg fill="none" stroke="currentColor" strokeWidth="1.5" viewBox="0 0 24 24">
                      <circle cx="12" cy="12" r="10" stroke="currentColor" />
                      <path strokeLinecap="round" strokeLinejoin="round" d="M10 8l4 4-4 4" />
                    </svg>
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ─── TIMELESS COMFORT ─── */}
      <section className="home-timeless nsh-timeless">
        <div className="max-width nsh-timeless-inner">
          <h2 className="nsh-section-title">{timelessTitle}</h2>
          <hr className="nsh-timeless-hr" />
          <p className="nsh-timeless-text">{timelessDesc}</p>
          <Link href={timelessBtnLink} className="nsh-btn-outline-dark">
            {timelessBtnText}
          </Link>
        </div>
      </section>

      {/* ─── WHY CHOOSE US ─── */}
      <section className="home-why-choose nsh-why">
        <div className="max-width nsh-section-inner">
          <h2 className="nsh-section-title">Why Choose Us?</h2>
          <hr className="nsh-why-hr" />
          <div className="nsh-why-grid">
            {whyChooseUsData.map((item: any, i: number) => (
              <div key={i} className="nsh-why-item">
                <span className="nsh-why-label">{item.label}</span>
                <h3 className="nsh-why-heading">{item.heading}</h3>
                <p className="nsh-why-text">{item.text}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ─── VR TOUR SECTION ─── */}
      <section className="home-vr-tour nsh-vr" id="vr-tour">
        <div className="max-width nsh-vr-inner">
          <h2 className="nsh-vr-title">{vrTitle}</h2>
          <hr className="nsh-vr-hr" />
          <p className="nsh-vr-text">{vrDesc}</p>
          <div className="nsh-vr-banner" style={{ backgroundImage: `url(${vrBannerImg})` }}>
            <Link href={vrBtnLink} className="nsh-vr-btn">
              <svg
                width="18"
                height="18"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
              >
                <circle cx="12" cy="12" r="10" />
                <line x1="2" y1="12" x2="22" y2="12" />
                <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z" />
              </svg>
              {vrBtnText}
            </Link>
          </div>
        </div>
      </section>

      {/* ─── OUR LISTINGS ─── */}
      <section className="home-listings nsh-listings">
        <div className="max-width nsh-section-inner" style={{ marginBottom: '3rem' }}>
          <h2 className="nsh-section-title">
            Our <span className="accent">listings</span>
          </h2>
          <hr className="nsh-gradient-rule-gold" />
        </div>

        <div className="max-width nsh-listings-scroll-wrap nsh-section-inner">
          <div
            ref={listingsRef}
            className="nsh-listings-track"
            onMouseDown={onMouseDown}
            onMouseMove={onMouseMove}
            onMouseUp={onMouseUp}
            onMouseLeave={onMouseUp}
          >
            {listingsData.map((listing, i) => (
              <div key={i} className="nsh-listing-card">
                <div className="nsh-listing-img-container">
                  <img
                    src={listing.image}
                    alt={listing.title}
                    className="nsh-listing-img"
                    draggable={false}
                  />
                  <span className="nsh-listing-status">
                    <span
                      className={`nsh-status-dot ${listing.status.toLowerCase().replace(/\s+/g, '-')}`}
                    />
                    {listing.status}
                  </span>
                </div>
                <div className="nsh-listing-body">
                  <div className="nsh-listing-info-row">
                    <h3 className="nsh-listing-title">{listing.title}</h3>
                    <span className="nsh-listing-details">{listing.details}</span>
                  </div>
                  <div className="nsh-listing-link-row">
                    <Link href={listing.href} className="nsh-listing-link">
                      <span>View Property</span>
                      <svg
                        width="10"
                        height="10"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth="2.5"
                        style={{ marginLeft: '4px' }}
                      >
                        <path d="M9 18l6-6-6-6" />
                        <path d="M15 18l6-6-6-6" opacity="0.7" />
                      </svg>
                    </Link>
                  </div>
                </div>
              </div>
            ))}
          </div>
          <div style={{ display: 'flex', justifyContent: 'center', marginTop: '3rem' }}>
            <Link href="/properties" className="nsh-btn-outline-dark">
              View All Properties
            </Link>
          </div>
        </div>
      </section>

      {/* ─── CONCIERGE BANNER ─── */}
      <section className="home-concierge nsh-concierge">
        <div className="max-width nsh-concierge-inner">
          <div className="nsh-concierge-left">
            <h2 className="nsh-concierge-title">{conciergeTitle}</h2>
            <hr className="nsh-concierge-hr" />
            <p className="nsh-concierge-text">{conciergeDesc}</p>
            <Link href={conciergeBtnLink} className="nsh-btn-outline-white">
              {conciergeBtnText}
            </Link>
          </div>
          <div className="nsh-concierge-right" style={{ backgroundImage: `url(${conciergeImg})` }} />
        </div>
      </section>

      {/* ─── NEWEST RESIDENCES ─── */}
      <section className="home-newest-residences nsh-newest">
        <div className="max-width nsh-section-inner">
          <h2 className="nsh-newest-title">{newestTitle}</h2>
          <hr
            className="nsh-gradient-rule-dark"
            style={{ border: 'none', borderTop: '1px solid #e0e0e0', margin: '1rem 0' }}
          />
          <p className="nsh-newest-text">{newestDesc}</p>
          <div className="nsh-newest-video-wrap">
            <iframe
              className="nsh-newest-iframe"
              src={newestVideoUrl}
              title="A New Standard in Houston Luxury Living | The Potomac by Novel Signature Homes"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              allowFullScreen
            />
          </div>
          <div style={{ display: 'flex', justifyContent: 'center', marginTop: '2.5rem' }}>
            <Link
              href={newestSubscribeLink}
              className="nsh-btn-outline-dark"
              target="_blank"
              rel="noopener noreferrer"
            >
              Subscribe
            </Link>
          </div>
        </div>
      </section>

      {/* ─── CONTACT SECTION ─── */}
      <section className="home-contact nsh-contact">
        <div className="max-width nsh-contact-grid">
          <div className="nsh-contact-left">
            <h2 className="nsh-contact-title">{renderContactHeading()}</h2>
          </div>
          <div className="nsh-contact-right">
            {submitted ? (
              <div className="nsh-contact-success">Thank you! We&apos;ll be in touch shortly.</div>
            ) : (
              <form
                className="nsh-contact-form"
                onSubmit={(e) => {
                  e.preventDefault()
                  setSubmitted(true)
                }}
              >
                <div className="nsh-form-group">
                  <label className="nsh-form-label" htmlFor="contact-name">
                    Name <span className="required">*</span>
                  </label>
                  <input
                    id="contact-name"
                    className="nsh-form-input"
                    type="text"
                    required
                    value={formData.name}
                    onChange={(e) => setFormData((f) => ({ ...f, name: e.target.value }))}
                  />
                </div>
                <div className="nsh-form-group">
                  <label className="nsh-form-label" htmlFor="contact-phone">
                    Phone
                  </label>
                  <input
                    id="contact-phone"
                    className="nsh-form-input"
                    type="tel"
                    value={formData.phone}
                    onChange={(e) => setFormData((f) => ({ ...f, phone: e.target.value }))}
                  />
                </div>
                <div className="nsh-form-group">
                  <label className="nsh-form-label" htmlFor="contact-email">
                    Email <span className="required">*</span>
                  </label>
                  <input
                    id="contact-email"
                    className="nsh-form-input"
                    type="email"
                    required
                    value={formData.email}
                    onChange={(e) => setFormData((f) => ({ ...f, email: e.target.value }))}
                  />
                </div>
                <div className="nsh-form-group">
                  <label className="nsh-form-label" htmlFor="contact-message">
                    Message
                  </label>
                  <textarea
                    id="contact-message"
                    className="nsh-form-textarea"
                    value={formData.message}
                    onChange={(e) => setFormData((f) => ({ ...f, message: e.target.value }))}
                  />
                </div>
                <button type="submit" className="nsh-form-submit">
                  Submit
                </button>
              </form>
            )}
          </div>
        </div>
      </section>
    </>
  )
}

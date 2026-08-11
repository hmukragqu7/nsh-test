import React from 'react'
import Link from 'next/link'
import { ScrollToTopButton } from './ScrollToTop.client'

export async function Footer() {
  return (
    <footer
      style={{
        backgroundColor: '#1f1f1f',
        color: '#ffffff',
        padding: '4rem 2rem 2rem',
        fontFamily: "'Montserrat', sans-serif",
      }}
    >
      {/* Top Footer Container */}
      <div className="max-w-[1440px] mx-auto flex flex-col lg:grid lg:grid-cols-12 gap-8">
        {/* Column 1: Logo, Tagline & Socials */}
        <div className="lg:col-span-4 flex flex-col items-center lg:items-start text-center lg:text-left">
          {/* Logo & Tagline */}
          <Link href="/" style={{ textDecoration: 'none', color: 'inherit', display: 'flex', alignItems: 'center', marginBottom: '1.25rem' }}>
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/media/footer-logo.svg" alt="Novel Signature Homes" style={{ height: '72px', width: 'auto', objectFit: 'contain' }} />
          </Link>

          {/* Social Icons Row */}
          <div style={{ display: 'flex', gap: '1.25rem', alignItems: 'center', justifyContent: 'center' }}>
            <a
              href="https://www.instagram.com/novelsignaturehomes/"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="Instagram"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 448 512">
                <path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z" />
              </svg>
            </a>
            <a
              href="https://www.linkedin.com/company/novel-signature-homes/"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="LinkedIn"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 448 512">
                <path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z" />
              </svg>
            </a>
            <a
              href="https://www.facebook.com/people/Novel-Signature-Homes/61566500864621/"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="Facebook"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 448 512">
                <path d="M400 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h137.3V327.7h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.27c-30.81 0-40.42 19.12-40.42 38.73V256h68.78l-11 71.69h-57.78V480H400a48 48 0 0 0 48-48V80a48 48 0 0 0 -48-48z" />
              </svg>
            </a>
            <a
              href="https://www.youtube.com/@NovelSignatureHomes"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="YouTube"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 576 512">
                <path d="M549.7 124.1c-6.281-23.65-24.79-42.28-48.28-48.6C458.8 64 288 64 288 64S117.2 64 74.63 75.49c-23.5 6.322-42 24.95-48.28 48.6-11.41 42.87-11.41 132.3-11.41 132.3s0 89.44 11.41 132.3c6.281 23.65 24.79 41.5 48.28 47.82C117.2 448 288 448 288 448s170.8 0 213.4-11.49c23.5-6.321 42-24.17 48.28-47.82 11.41-42.87 11.41-132.3 11.41-132.3s0-89.44-11.41-132.3zm-317.5 213.5V175.2l142.7 81.21-142.7 81.2z" />
              </svg>
            </a>
            <a
              href="https://x.com/nsignaturehomes"
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="X"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="16" height="16" fill="currentColor" viewBox="0 0 512 512">
                <path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z" />
              </svg>
            </a>
          </div>
        </div>

        {/* Column 2: Navigation Links */}
        <div className="lg:col-span-2 flex flex-col items-center lg:items-start my-4 lg:my-0">
          <div className="flex flex-col gap-3 text-[13px]" style={{ fontFamily: "'Montserrat', sans-serif" }}>
            <Link href="/" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
              Home
            </Link>
            <Link href="/properties" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
              Properties
            </Link>
            <Link href="/blogs" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
              Blogs
            </Link>
            <Link href="/about" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
              About
            </Link>
            <Link href="/contact" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
              Contact Us
            </Link>
          </div>
        </div>

        {/* Column 3: Contact Us info (2 sub-columns under full-width divider) */}
        <div className="lg:col-span-6 flex flex-col">
          <h3
            style={{
              fontFamily: "'Cormorant Garamond', Georgia, serif",
              fontSize: '24px',
              fontWeight: '400',
              color: '#ffffff',
              margin: 0,
              letterSpacing: '0.5px',
            }}
          >
            Contact Us
          </h3>
          <hr
            style={{
              border: 'none',
              borderTop: '1px solid rgba(255, 255, 255, 0.2)',
              margin: '0.6rem 0 1.25rem',
              width: '100%',
            }}
          />

          {/* 2-column Layout for Contact Info */}
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-3 text-[13px] text-gray-300">
            {/* Left Sub-column: Phone & Email */}
            <div className="flex flex-col gap-3">
              {/* Phone */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                <span className="text-[#ffffff]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0 }}>
                  <svg width="15" height="15" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" viewBox="0 0 24 24">
                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" />
                  </svg>
                </span>
                <a href="tel:+16067075050" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
                  +1 (606)-707-5050
                </a>
              </div>

              {/* Email */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
                <span className="text-[#ffffff]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0 }}>
                  <svg width="15" height="15" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" viewBox="0 0 24 24">
                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                    <polyline points="22,6 12,13 2,6" />
                  </svg>
                </span>
                <a href="mailto:info@novelsignaturehomes.com" className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none' }}>
                  info@novelsignaturehomes.com
                </a>
              </div>
            </div>

            {/* Right Sub-column: Address */}
            <div className="flex flex-col">
              <div style={{ display: 'flex', alignItems: 'flex-start', gap: '0.6rem' }}>
                <span className="text-[#ffffff]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0, marginTop: '2px' }}>
                  <svg width="15" height="15" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" viewBox="0 0 24 24">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
                    <circle cx="12" cy="10" r="3" />
                  </svg>
                </span>
                <span style={{ lineHeight: '1.4', color: '#e5e7eb' }}>
                  11133 Shady Trail #171, Dallas, TX 75229
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Single Line Bottom Copyright & Legal Links */}
      <hr
        style={{
          border: 'none',
          borderTop: '1px solid rgba(255, 255, 255, 0.1)',
          margin: '3rem 0 1.5rem',
        }}
      />
      <div
        className="max-w-[1440px] mx-auto flex flex-wrap items-center justify-center gap-x-3 gap-y-1 text-center text-xs text-gray-400"
        style={{ fontFamily: "'Montserrat', sans-serif" }}
      >
        <span>Copyright © 2026 Novel Signature Homes | All Rights Reserved.</span>
        <Link
          href="/privacy-policy"
          className="text-gray-400 hover:text-white transition-colors duration-200"
          style={{ textDecoration: 'underline' }}
        >
          Privacy Policy
        </Link>
        <Link
          href="/terms-and-conditions"
          className="text-gray-400 hover:text-white transition-colors duration-200"
          style={{ textDecoration: 'underline' }}
        >
          Terms&Conditions
        </Link>
      </div>
      <ScrollToTopButton />
    </footer>
  )
}

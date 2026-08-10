import React from 'react'
import Link from 'next/link'
import { Logo } from '@/components/Logo/Logo'
import { ScrollToTopButton } from './ScrollToTop.client'

export async function Footer() {
  return (
    <footer
      style={{
        backgroundColor: '#141514',
        color: '#ffffff',
        padding: '5rem 2rem 2.5rem',
        borderTop: '1px solid rgba(255, 255, 255, 0.05)',
        fontFamily: "'Montserrat', sans-serif",
      }}
    >
      {/* Top Footer Container */}
      <div className="max-w-[1440px] mx-auto flex flex-col lg:grid lg:grid-cols-12 gap-8 lg:gap-8">
        {/* Column 1: Logo, Tagline & Socials */}
        <div className="lg:col-span-4 flex flex-col items-center lg:items-start text-center lg:text-left">
          {/* Logo & Tagline (Footer SVG) */}
          <Link href="/" style={{ textDecoration: 'none', color: 'inherit', display: 'flex', alignItems: 'center', marginBottom: '1.25rem' }}>
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img src="/media/footer-logo.svg" alt="Novel Signature Homes" style={{ height: '72px', width: 'auto', objectFit: 'contain' }} />
          </Link>

          {/* Social Icons Row */}
          <div style={{ display: 'flex', gap: '1.25rem', alignItems: 'center', justifyContent: 'center' }}>
            {/* Instagram */}
            <a
              href="#"
              className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="Instagram"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
              </svg>
            </a>
            {/* LinkedIn */}
            <a
              href="#"
              className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="LinkedIn"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z" />
              </svg>
            </a>
            {/* Facebook */}
            <a
              href="#"
              className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="Facebook"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                <path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z" />
              </svg>
            </a>
            {/* YouTube */}
            <a
              href="#"
              className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="YouTube"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                <path d="M23.498 6.163c-.272-1.02-1.028-1.828-2.023-2.102C19.69 3.5 12 3.5 12 3.5s-7.69 0-9.475.561C1.53 4.335.774 5.143.502 6.163.029 7.977 0 11.75 0 11.75s0 3.773.502 5.586c.272 1.02 1.028 1.828 2.023 2.102 1.785.562 9.475.562 9.475.562s7.69 0 9.475-.562c.995-.274 1.751-1.082 2.023-2.102.473-1.813.502-5.586.502-5.586s-.029-3.773-.502-5.587zM9.545 15.568V7.932L15.818 11.75l-6.273 3.818z" />
              </svg>
            </a>
            {/* X */}
            <a
              href="#"
              className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
              aria-label="X"
              style={{ display: 'inline-flex', alignItems: 'center', justifyContent: 'center' }}
            >
              <svg width="16" height="16" fill="currentColor" viewBox="0 0 24 24">
                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
              </svg>
            </a>
          </div>
        </div>

        {/* Column 2: Navigation Links (Inline pipe-separated on mobile, vertical column on desktop) */}
        <div className="lg:col-span-2 lg:col-start-5 flex flex-col items-center lg:items-start my-4 lg:my-0">
          {/* Mobile pipe-separated inline navigation */}
          <div
            className="flex lg:hidden flex-wrap items-center justify-center gap-x-2 gap-y-1 text-[13px] text-gray-300"
            style={{ fontFamily: "'Montserrat', sans-serif" }}
          >
            <Link href="/" className="hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none', color: 'inherit' }}>
              Home
            </Link>
            <span style={{ color: 'rgba(255,255,255,0.3)' }}>|</span>
            <Link href="/properties" className="hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none', color: 'inherit' }}>
              Properties
            </Link>
            <span style={{ color: 'rgba(255,255,255,0.3)' }}>|</span>
            <Link href="/blogs" className="hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none', color: 'inherit' }}>
              Blogs
            </Link>
            <span style={{ color: 'rgba(255,255,255,0.3)' }}>|</span>
            <Link href="/about" className="hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none', color: 'inherit' }}>
              About
            </Link>
            <span style={{ color: 'rgba(255,255,255,0.3)' }}>|</span>
            <Link href="/contact" className="hover:text-[#dfcbb5] transition-colors duration-200" style={{ textDecoration: 'none', color: 'inherit' }}>
              Contact Us
            </Link>
          </div>

          {/* Desktop vertical column navigation */}
          <div
            className="hidden lg:flex flex-col gap-3 text-[13px]"
            style={{ fontFamily: "'Montserrat', sans-serif" }}
          >
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

        {/* Column 3: Contact Us info */}
        <div className="lg:col-span-6 lg:col-start-7 flex flex-col">
          <h3
            style={{
              fontFamily: "'Cormorant Garamond', Georgia, serif",
              fontSize: '26px',
              fontWeight: '400',
              color: '#ffffff',
              margin: 0,
              letterSpacing: '1px',
            }}
          >
            Contact Us
          </h3>
          <hr
            style={{
              border: 'none',
              borderTop: '1px solid rgba(255, 255, 255, 0.15)',
              margin: '0.5rem 0 1.5rem',
              width: '100%',
            }}
          />

          {/* Contact Details List */}
          <div className="flex flex-col gap-4 text-[14px] text-gray-300">
            {/* Phone */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
              <span className="text-[#dfcbb5]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0 }}>
                <svg
                  width="18"
                  height="18"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  viewBox="0 0 24 24"
                >
                  <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" />
                </svg>
              </span>
              <a
                href="tel:+16067075050"
                className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
                style={{ textDecoration: 'none' }}
              >
                +1 (606)-707-5050
              </a>
            </div>

            {/* Email */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
              <span className="text-[#dfcbb5]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0 }}>
                <svg
                  width="18"
                  height="18"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  viewBox="0 0 24 24"
                >
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                  <polyline points="22,6 12,13 2,6" />
                </svg>
              </span>
              <a
                href="mailto:info@novelsignaturehomes.com"
                className="text-gray-300 hover:text-[#dfcbb5] transition-colors duration-200"
                style={{ textDecoration: 'none' }}
              >
                info@novelsignaturehomes.com
              </a>
            </div>

            {/* Address */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
              <span className="text-[#dfcbb5]" style={{ display: 'flex', alignItems: 'center', flexShrink: 0 }}>
                <svg
                  width="18"
                  height="18"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  viewBox="0 0 24 24"
                >
                  <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
                  <circle cx="12" cy="10" r="3" />
                </svg>
              </span>
              <span style={{ lineHeight: '1.5', color: '#ffffff' }}>
                11133 Shady Trail #171, Dallas, TX 75229
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Copyright Bar */}
      <hr
        style={{
          border: 'none',
          borderTop: '1px solid rgba(255, 255, 255, 0.08)',
          margin: '2.5rem 0 1.5rem',
        }}
      />
      <div
        className="max-w-[1440px] mx-auto flex flex-col items-center justify-center gap-2 text-center text-xs text-gray-400"
        style={{ fontFamily: "'Montserrat', sans-serif" }}
      >
        <div>
          Copyright © 2026 Novel Signature Homes | All Rights Reserved.
        </div>
        <div>
          <Link
            href="/privacy-policy"
            className="text-gray-400 hover:text-white transition-colors duration-200"
            style={{ textDecoration: 'underline' }}
          >
            Privacy Policy
          </Link>{' '}
          <Link
            href="/terms"
            className="text-gray-400 hover:text-white transition-colors duration-200"
            style={{ textDecoration: 'underline', marginLeft: '8px' }}
          >
            Terms&Conditions
          </Link>
        </div>
        <div style={{ marginTop: '0.5rem' }}>
          <ScrollToTopButton />
        </div>
      </div>
    </footer>
  )
}

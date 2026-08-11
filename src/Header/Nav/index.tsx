'use client'

import React, { useState, useEffect } from 'react'
import { createPortal } from 'react-dom'
import type { Header as HeaderType } from '@/payload-types'
import { CMSLink } from '@/components/Link'
import Link from 'next/link'

export const HeaderNav: React.FC<{ data: HeaderType }> = ({ data }) => {
  const navItems = data?.navItems || []
  const [mobileOpen, setMobileOpen] = useState(false)
  const [dropdownOpen, setDropdownOpen] = useState(false)
  const [mobileContactOpen, setMobileContactOpen] = useState(false)
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    setMounted(true)
  }, [])

  // Lock body scroll when mobile menu is open
  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = 'hidden'
    } else {
      document.body.style.overflow = ''
    }
    return () => {
      document.body.style.overflow = ''
    }
  }, [mobileOpen])

  // Filter out 'Contact' from the desktop main nav list to avoid duplication
  const desktopNavItems = navItems.filter(({ link }) => link.label?.toLowerCase() !== 'contact')

  const contactDropdownItems = [
    {
      label: 'info@novelsignaturehomes.com',
      href: 'mailto:info@novelsignaturehomes.com',
    },
    {
      label: '+1 (606)-707-5050',
      href: 'tel:+16067075050',
    },
    {
      label: 'Buy A Home',
      href: '/buy-a-home',
    },
    {
      label: 'Trade Inquiry',
      href: '/trade-inquiry',
    },
    {
      label: 'Other Inquiries',
      href: '/other-inquiries',
    },
  ]

  const mobileMenuDrawer =
    mounted && mobileOpen && typeof document !== 'undefined'
      ? createPortal(
          <div
            className="nsh-mobile-menu"
            style={{
              position: 'fixed',
              top: '80px',
              left: 0,
              right: 0,
              bottom: 0,
              height: 'calc(100vh - 80px)',
              backgroundColor: '#0a0a0a',
              backdropFilter: 'blur(16px)',
              WebkitBackdropFilter: 'blur(16px)',
              borderTop: '1px solid rgba(255,255,255,0.08)',
              padding: '2rem 1.75rem 4rem',
              display: 'flex',
              flexDirection: 'column',
              gap: '1.25rem',
              zIndex: 999999,
              overflowY: 'auto',
            }}
          >
            {desktopNavItems && desktopNavItems.length > 0 ? (
              desktopNavItems.map(({ link }, i) => (
                <div key={i} onClick={() => setMobileOpen(false)}>
                  <CMSLink
                    {...link}
                    appearance="link"
                    style={{
                      color: '#ffffff',
                      textDecoration: 'none',
                      fontSize: '14px',
                      letterSpacing: '1.5px',
                      fontFamily: "'Montserrat', sans-serif",
                      fontWeight: '500',
                      display: 'block',
                      padding: '0.5rem 0',
                    }}
                  />
                </div>
              ))
            ) : (
              <>
                <Link href="/" onClick={() => setMobileOpen(false)} style={{ color: '#fff', fontSize: '14px', letterSpacing: '1.5px', textDecoration: 'none', fontWeight: '500', padding: '0.5rem 0' }}>Home</Link>
                <Link href="/properties" onClick={() => setMobileOpen(false)} style={{ color: '#fff', fontSize: '14px', letterSpacing: '1.5px', textDecoration: 'none', fontWeight: '500', padding: '0.5rem 0' }}>Properties</Link>
                <Link href="/concierge-service" onClick={() => setMobileOpen(false)} style={{ color: '#fff', fontSize: '14px', letterSpacing: '1.5px', textDecoration: 'none', fontWeight: '500', padding: '0.5rem 0' }}>Concierge</Link>
                <Link href="/blogs" onClick={() => setMobileOpen(false)} style={{ color: '#fff', fontSize: '14px', letterSpacing: '1.5px', textDecoration: 'none', fontWeight: '500', padding: '0.5rem 0' }}>Blogs</Link>
                <Link href="/about" onClick={() => setMobileOpen(false)} style={{ color: '#fff', fontSize: '14px', letterSpacing: '1.5px', textDecoration: 'none', fontWeight: '500', padding: '0.5rem 0' }}>About</Link>
              </>
            )}

            {/* Mobile Contact Sub-menu */}
            <div style={{ borderTop: '1px solid rgba(255,255,255,0.1)', paddingTop: '1rem' }}>
              <button
                onClick={() => setMobileContactOpen(!mobileContactOpen)}
                style={{
                  background: 'none',
                  border: 'none',
                  color: '#ffffff',
                  fontSize: '14px',
                  letterSpacing: '1.5px',
                  fontFamily: "'Montserrat', sans-serif",
                  fontWeight: '500',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  width: '100%',
                  padding: '0.5rem 0',
                  cursor: 'pointer',
                }}
              >
                <span>Contact</span>
                <svg
                  width="12"
                  height="12"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2.5"
                  style={{
                    transform: mobileContactOpen ? 'rotate(180deg)' : 'rotate(0deg)',
                    transition: 'transform 0.2s',
                  }}
                >
                  <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
                </svg>
              </button>

              {mobileContactOpen && (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', paddingLeft: '1rem', marginTop: '0.5rem' }}>
                  {contactDropdownItems.map((item, idx) => (
                    <a
                      key={idx}
                      href={item.href}
                      onClick={() => setMobileOpen(false)}
                      style={{
                        color: '#dfcbb5',
                        textDecoration: 'none',
                        fontSize: '13px',
                        fontFamily: "'Montserrat', sans-serif",
                        fontWeight: '500',
                        padding: '0.25rem 0',
                      }}
                    >
                      {item.label}
                    </a>
                  ))}
                </div>
              )}
            </div>
          </div>,
          document.body,
        )
      : null

  return (
    <>
      {/* Desktop Nav */}
      <nav
        style={{
          display: 'flex',
          gap: '2rem',
          alignItems: 'center',
          fontFamily: "'Montserrat', sans-serif",
          fontSize: '13px',
          letterSpacing: '1.2px',
        }}
        className="nsh-desktop-nav"
      >
        {desktopNavItems.map(({ link }, i) => (
          <CMSLink
            key={i}
            {...link}
            appearance="link"
            style={{
              color: '#ffffff',
              textDecoration: 'none',
              transition: 'color 0.2s',
              fontWeight: '500',
            }}
          />
        ))}

        {/* Contact dropdown */}
        <div
          style={{ position: 'relative' }}
          className="nsh-contact-wrap"
          onMouseEnter={() => setDropdownOpen(true)}
          onMouseLeave={() => setDropdownOpen(false)}
        >
          <a
            href="/contact"
            style={{
              background: 'none',
              border: 'none',
              color: '#ffffff',
              fontFamily: "'Montserrat', sans-serif",
              fontSize: '13px',
              letterSpacing: '1.2px',
              fontWeight: '500',
              cursor: 'pointer',
              padding: '10px 0',
              display: 'flex',
              alignItems: 'center',
              gap: '6px',
              textDecoration: 'none',
            }}
          >
            <span>Contact</span>
            <svg
              width="10"
              height="10"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2.5"
              style={{
                transform: dropdownOpen ? 'rotate(180deg)' : 'rotate(0deg)',
                transition: 'transform 0.2s ease',
              }}
            >
              <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
            </svg>
          </a>

          <div
            className="nsh-dropdown"
            style={{
              position: 'absolute',
              top: '100%',
              right: 0,
              backgroundColor: '#313131',
              minWidth: '270px',
              padding: '6px 0',
              borderRadius: '2px',
              boxShadow: '0 8px 24px rgba(0,0,0,0.4)',
              zIndex: 200,
              opacity: dropdownOpen ? 1 : 0,
              pointerEvents: dropdownOpen ? 'all' : 'none',
              transform: dropdownOpen ? 'translateY(0)' : 'translateY(-6px)',
              transition: 'opacity 0.2s ease, transform 0.2s ease',
            }}
          >
            {contactDropdownItems.map((item, idx) => (
              <a
                key={idx}
                href={item.href}
                className="nsh-dropdown-item"
                style={{
                  display: 'block',
                  padding: '10px 18px',
                  color: '#ffffff',
                  fontSize: '14px',
                  textDecoration: 'none',
                  textTransform: 'none',
                  letterSpacing: '0.2px',
                  fontWeight: '400',
                  fontFamily: "'Montserrat', sans-serif",
                  transition: 'background-color 0.15s ease',
                  whiteSpace: 'nowrap',
                }}
              >
                {item.label}
              </a>
            ))}
          </div>
        </div>
      </nav>

      {/* Mobile hamburger button */}
      <button
        className="nsh-mobile-nav-btn"
        onClick={() => setMobileOpen(!mobileOpen)}
        style={{
          background: 'none',
          border: 'none',
          color: '#ffffff',
          cursor: 'pointer',
          padding: '8px',
          display: 'none',
          position: 'relative',
          zIndex: 100000,
        }}
        aria-label="Toggle menu"
      >
        <svg
          width="28"
          height="28"
          fill="none"
          stroke="currentColor"
          strokeWidth="2.5"
          viewBox="0 0 24 24"
        >
          {mobileOpen ? (
            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
          ) : (
            <path strokeLinecap="round" strokeLinejoin="round" d="M4 6h16M4 12h16M4 18h16" />
          )}
        </svg>
      </button>

      {/* Mobile Menu Portal */}
      {mobileMenuDrawer}

      <style>{`
        .nsh-contact-wrap:hover .nsh-dropdown {
          opacity: 1 !important;
          pointer-events: all !important;
          transform: translateY(0) !important;
        }
        .nsh-dropdown-item:hover {
          background-color: #1f1f1f !important;
        }
        @media (max-width: 768px) {
          .nsh-desktop-nav { display: none !important; }
          .nsh-mobile-nav-btn { display: flex !important; }
        }
      `}</style>
    </>
  )
}


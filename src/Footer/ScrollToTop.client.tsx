'use client'

import React, { useEffect, useState } from 'react'

export const ScrollToTopButton: React.FC = () => {
  const [isVisible, setIsVisible] = useState(false)

  useEffect(() => {
    const toggleVisibility = () => {
      if (window.scrollY > 200) {
        setIsVisible(true)
      } else {
        setIsVisible(false)
      }
    }

    // Initial check
    toggleVisibility()

    window.addEventListener('scroll', toggleVisibility)
    return () => window.removeEventListener('scroll', toggleVisibility)
  }, [])

  const handleScrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    })
  }

  if (!isVisible) return null

  return (
    <button
      onClick={handleScrollToTop}
      aria-label="Scroll to top"
      style={{
        position: 'fixed',
        bottom: '25px',
        right: '25px',
        zIndex: 9999,
        backgroundColor: '#1f1f1f',
        color: '#ffffff',
        border: 'none',
        borderRadius: '4px',
        width: '30px',
        height: '30px',
        padding: 0,
        cursor: 'pointer',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        boxShadow: '0 4px 10px rgba(0,0,0,0.35)',
        transition: 'all 0.2s ease-in-out',
      }}
      className="hover:bg-[#333333] opacity-90 hover:opacity-100"
    >
      <svg
        width="20"
        height="20"
        fill="none"
        stroke="#ffffff"
        strokeWidth="2.5"
        strokeLinecap="round"
        strokeLinejoin="round"
        viewBox="0 0 24 24"
      >
        <polyline points="18 15 12 9 6 15" />
      </svg>
    </button>
  )
}

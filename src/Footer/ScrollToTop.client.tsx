'use client'

import React from 'react'

export const ScrollToTopButton: React.FC = () => {
  const handleScrollToTop = () => {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    })
  }

  return (
    <button
      onClick={handleScrollToTop}
      aria-label="Scroll to top"
      className="text-gray-400 hover:text-[#dfcbb5] transition-colors duration-200"
      style={{
        background: 'none',
        border: 'none',
        padding: '8px',
        cursor: 'pointer',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      <svg
        width="18"
        height="18"
        fill="none"
        stroke="currentColor"
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

'use client'
import { useHeaderTheme } from '@/providers/HeaderTheme'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import React, { useEffect, useState } from 'react'

import type { Header } from '@/payload-types'

import { Logo } from '@/components/Logo/Logo'
import { HeaderNav } from './Nav'

interface HeaderClientProps {
  data: Header
  settings?: any
}

export const HeaderClient: React.FC<HeaderClientProps> = ({ data, settings }) => {
  const [theme, setTheme] = useState<string | null>(null)
  const [scrolled, setScrolled] = useState(false)
  const { headerTheme, setHeaderTheme } = useHeaderTheme()
  const pathname = usePathname()
  const isHome = pathname === '/'

  useEffect(() => {
    setHeaderTheme(null)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pathname])

  useEffect(() => {
    if (headerTheme && headerTheme !== theme) setTheme(headerTheme)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [headerTheme])

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 60)
    }
    window.addEventListener('scroll', handleScroll, { passive: true })
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  return (
    <header
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        zIndex: 100,
        transition: 'background-color 0.4s ease, backdrop-filter 0.4s ease',
        backgroundColor: 'rgba(15, 15, 15, 0.88)',
        backdropFilter: 'blur(12px)',
        WebkitBackdropFilter: 'blur(12px)',
        borderBottom: '1px solid rgba(255, 255, 255, 0.08)',
        fontFamily: "'Montserrat', sans-serif",
      }}
      {...(theme ? { 'data-theme': theme } : {})}
    >
      <div
        className="nsh-header-inner"
        style={{
          maxWidth: '1440px',
          margin: '0 auto',
          padding: '0 1.5rem',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          height: '80px',
          width: '100%',
          boxSizing: 'border-box',
        }}
      >
        <Link href="/" style={{ display: 'flex', alignItems: 'center' }}>
          <Logo loading="eager" priority="high" logo={settings?.headerLogo} />
        </Link>
        <HeaderNav data={data} />
      </div>
    </header>
  )
}

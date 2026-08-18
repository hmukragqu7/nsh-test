import type { Metadata } from 'next'
import Script from 'next/script'
import { cn } from '@/utilities/ui'
import { GeistMono } from 'geist/font/mono'
import { GeistSans } from 'geist/font/sans'
import React from 'react'

import NextTopLoader from 'nextjs-toploader'

import { AdminBar } from '@/components/AdminBar'
import { Footer } from '@/Footer/Component'
import { Header } from '@/Header/Component'
import { Providers } from '@/providers'
import { mergeOpenGraph } from '@/utilities/mergeOpenGraph'
import { draftMode } from 'next/headers'
import { getCachedGlobal } from '@/utilities/getGlobals'
import { FloatingContactWidget } from '@/components/FloatingContactWidget'
import { getServerSideURL } from '@/utilities/getURL'
import './globals.css'

const themeInitScript = `(function () {
  function getImplicitPreference() {
    var mediaQuery = '(prefers-color-scheme: dark)'
    var mql = window.matchMedia(mediaQuery)
    var hasImplicitPreference = typeof mql.matches === 'boolean'
    if (hasImplicitPreference) return mql.matches ? 'dark' : 'light'
    return null
  }
  function themeIsValid(theme) {
    return theme === 'light' || theme === 'dark'
  }
  var themeToSet = 'light'
  var preference = window.localStorage.getItem('payload-theme')
  if (themeIsValid(preference)) {
    themeToSet = preference
  } else {
    var implicitPreference = getImplicitPreference()
    if (implicitPreference) themeToSet = implicitPreference
  }
  document.documentElement.setAttribute('data-theme', themeToSet)
})();`

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const { isEnabled } = await draftMode()
  const settings = await getCachedGlobal('settings', 1)()
  const faviconUrl = (settings?.siteIcon && typeof settings.siteIcon === 'object' && settings.siteIcon.url) || '/favicon.ico'

  return (
    <html className={cn(GeistSans.variable, GeistMono.variable)} lang="en" suppressHydrationWarning>
      <head>
        <script dangerouslySetInnerHTML={{ __html: themeInitScript }} />
        <link href={faviconUrl} rel="icon" sizes="32x32" />
        <link href={faviconUrl} rel="icon" type="image/svg+xml" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500&family=Montserrat:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"
        />
      </head>
      <body>
        <Providers>
          <NextTopLoader color="#C5A880" showSpinner={false} height={3} crawl={true} speed={200} shadow="0 0 10px #C5A880,0 0 5px #C5A880" />
          <Header />
          {children}
          <Footer />
          <FloatingContactWidget />
        </Providers>
      </body>
    </html>
  )
}

export const metadata: Metadata = {
  metadataBase: new URL(getServerSideURL()),
  openGraph: mergeOpenGraph(),
  twitter: {
    card: 'summary_large_image',
    creator: '@payloadcms',
  },
}

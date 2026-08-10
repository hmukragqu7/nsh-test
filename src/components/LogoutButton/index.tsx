'use client'

import React, { useState } from 'react'
import Link from 'next/link'
import { LogOut } from 'lucide-react'

export const LogoutButton: React.FC = () => {
  const [hover, setHover] = useState(false)

  return (
    <div className="pt-6 mt-8 border-t border-border flex flex-col gap-2">
      <span className="text-xs font-semibold uppercase tracking-wider text-muted-foreground">
        Account Actions
      </span>
      <div>
        <Link
          href="/admin/logout"
          onMouseEnter={() => setHover(true)}
          onMouseLeave={() => setHover(false)}
          style={{
            backgroundColor: hover ? '#c23b3b' : '#d86f6f',
            color: '#fff',
            padding: '0.625rem 1.25rem',
            borderRadius: '0.375rem',
            display: 'inline-flex',
            alignItems: 'center',
            gap: '0.5rem',
            fontWeight: 600,
            textDecoration: 'none',
            transition: 'background-color 0.2s ease',
          }}
        >
          <LogOut style={{ width: '18px', height: '18px' }} />
          Log Out
        </Link>
      </div>
    </div>
  )
}

export default LogoutButton

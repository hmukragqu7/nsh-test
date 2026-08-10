'use client'

import React from 'react'
import Link from 'next/link'
import { LogOut } from 'lucide-react'

export const SidebarLogout: React.FC = () => {
  return (
    <div className="mt-4 pt-4 border-t border-border px-2">
      <Link
        href="/admin/logout"
        className="flex items-center gap-2 px-3 py-2 text-sm font-medium text-red-500 hover:text-red-600 hover:bg-red-50 dark:hover:bg-red-950/30 rounded-md transition-colors w-full"
        style={{
          color: '#ef4444',
          display: 'flex',
          alignItems: 'center',
          gap: '0.5rem',
          padding: '0.5rem 0.75rem',
          borderRadius: '0.375rem',
          textDecoration: 'none',
          fontWeight: 500,
        }}
      >
        <LogOut style={{ width: '1rem', height: '1rem' }} />
        Log Out
      </Link>
    </div>
  )
}

export default SidebarLogout

'use client'
import React from 'react'
import { useFormFields } from '@payloadcms/ui'

/**
 * Custom Admin UI Component for Reading Time.
 * Displays stored numeric readingTime as formatted string (e.g. "🕒 5 min read")
 * in Payload Admin while keeping the raw database field numeric.
 */
export const ReadingTimeField: React.FC<{ path?: string; value?: number; field?: any }> = (props) => {
  const { path, value: propValue } = props

  let valueFromState: number | undefined
  try {
    const fieldState = useFormFields(([fields]) => (path ? fields[path] : null))
    valueFromState = fieldState?.value as number
  } catch {}

  const value = typeof propValue === 'number' ? propValue : typeof valueFromState === 'number' ? valueFromState : 0

  return (
    <div style={{ marginBottom: '1.25rem' }}>
      <label
        style={{
          display: 'block',
          fontSize: '0.85rem',
          fontWeight: 600,
          marginBottom: '0.35rem',
          color: 'var(--theme-elevation-800, #374151)',
        }}
      >
        Reading Time
      </label>
      <div
        style={{
          display: 'inline-flex',
          alignItems: 'center',
          gap: '8px',
          padding: '8px 14px',
          borderRadius: '6px',
          backgroundColor: 'var(--theme-elevation-100, #f3f4f6)',
          border: '1px solid var(--theme-elevation-250, #d1d5db)',
          fontSize: '0.9rem',
          fontWeight: 600,
          color: 'var(--theme-elevation-900, #111827)',
          width: '100%',
        }}
      >
        <span>🕒</span>
        <span>{value > 0 ? `${value} min read` : '1 min read'}</span>
      </div>
    </div>
  )
}
export default ReadingTimeField

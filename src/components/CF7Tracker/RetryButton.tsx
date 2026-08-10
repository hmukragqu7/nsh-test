'use client'

import React, { useState } from 'react'
import { useForm, useDocumentInfo } from '@payloadcms/ui'

export const RetryButton: React.FC = () => {
  const { id } = useDocumentInfo()
  const { getData, getSiblingData } = useForm()
  const [loading, setLoading] = useState(false)
  const [result, setResult] = useState<{ type: 'success' | 'error'; message: string } | null>(null)

  // Only render on existing saved documents
  if (!id) return null

  const handleRetry = async () => {
    setLoading(true)
    setResult(null)
    try {
      const response = await fetch(`/api/cf7-tracker/${id}/retry`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      })
      const data = await response.json()
      if (data.success) {
        setResult({ type: 'success', message: data.message || 'Pushed successfully!' })
        // Delay reload to let user see success message
        setTimeout(() => {
          window.location.reload()
        }, 1500)
      } else {
        setResult({ type: 'error', message: data.message || 'Failed to sync to ERP.' })
      }
    } catch (err: any) {
      setResult({ type: 'error', message: err.message || 'Request failed.' })
    } finally {
      setLoading(false)
    }
  }

  return (
    <div style={{ marginBottom: '1.5rem', padding: '1rem', border: '1px solid var(--theme-elevation-150)', borderRadius: '4px', backgroundColor: 'var(--theme-elevation-50)' }}>
      <h4 style={{ margin: '0 0 0.5rem 0', fontSize: '13px', textTransform: 'uppercase', letterSpacing: '0.5px' }}>Frappe ERP Integration</h4>
      <p style={{ margin: '0 0 0.75rem 0', fontSize: '11px', color: 'var(--theme-elevation-500)' }}>
        Pushes this submission to the Frappe Lead database using form mappings.
      </p>
      
      <button
        type="button"
        onClick={handleRetry}
        disabled={loading}
        style={{
          width: '100%',
          padding: '0.5rem 1rem',
          backgroundColor: loading ? '#888888' : '#8A561F',
          color: '#ffffff',
          border: 'none',
          borderRadius: '4px',
          cursor: loading ? 'not-allowed' : 'pointer',
          fontWeight: 'bold',
          fontSize: '12px',
          textTransform: 'uppercase',
          letterSpacing: '0.5px',
          transition: 'background-color 0.2s',
        }}
      >
        {loading ? 'Pushing Lead...' : 'Push to Frappe ERP'}
      </button>

      {result && (
        <div
          style={{
            marginTop: '0.75rem',
            padding: '0.5rem',
            borderRadius: '4px',
            fontSize: '11px',
            lineHeight: '1.4',
            backgroundColor: result.type === 'success' ? 'rgba(40, 167, 69, 0.1)' : 'rgba(220, 53, 69, 0.1)',
            color: result.type === 'success' ? '#28a745' : '#dc3545',
            border: `1px solid ${result.type === 'success' ? 'rgba(40, 167, 69, 0.2)' : 'rgba(220, 53, 69, 0.2)'}`,
          }}
        >
          {result.message}
        </div>
      )}
    </div>
  )
}

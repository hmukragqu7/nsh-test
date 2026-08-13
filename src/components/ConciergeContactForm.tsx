'use client'

import React, { useState } from 'react'

export function ConciergeContactForm({ formId = '5' }: { formId?: string }) {
  const [name, setName] = useState('')
  const [phone, setPhone] = useState('')
  const [email, setEmail] = useState('')
  const [message, setMessage] = useState('')
  const [status, setStatus] = useState<'idle' | 'submitting' | 'success' | 'error'>('idle')
  const [errorMsg, setErrorMsg] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!name || !email) return

    setStatus('submitting')
    setErrorMsg('')

    const submissionData = [
      { field: 'name', value: name },
      { field: 'phone', value: phone },
      { field: 'email', value: email },
      { field: 'message', value: message },
      { field: 'pageUrl', value: typeof window !== 'undefined' ? window.location.href : 'http://localhost:3000/concierge-service' },
    ]

    try {
      const res = await fetch('/api/form-submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          form: formId,
          submissionData,
        }),
      })

      if (res.ok) {
        setStatus('success')
        setName('')
        setPhone('')
        setEmail('')
        setMessage('')
      } else {
        const json = await res.json()
        setStatus('error')
        setErrorMsg(json?.errors?.[0]?.message || 'Failed to submit form. Please try again.')
      }
    } catch (err: any) {
      setStatus('error')
      setErrorMsg(err?.message || 'Network error. Please try again.')
    }
  }

  if (status === 'success') {
    return (
      <div style={{ backgroundColor: '#f0fdf4', border: '1px solid #bbf7d0', color: '#166534', padding: '24px', borderRadius: '4px', textAlign: 'center' }}>
        <h3 style={{ margin: '0 0 8px', fontSize: '18px', fontWeight: 600 }}>Thank You!</h3>
        <p style={{ margin: 0, fontSize: '14px' }}>Your message has been submitted successfully. Our team will contact you shortly.</p>
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
      {status === 'error' && (
        <div style={{ backgroundColor: '#fef2f2', border: '1px solid #fecaca', color: '#991b1b', padding: '12px 16px', borderRadius: '4px', fontSize: '13px' }}>
          {errorMsg}
        </div>
      )}

      <div>
        <label style={{ display: 'block', fontSize: '13px', color: '#333333', marginBottom: '6px', fontWeight: '500' }}>
          Name *
        </label>
        <input
          type="text"
          required
          value={name}
          onChange={(e) => setName(e.target.value)}
          className="concierge-form-input"
          placeholder="Your full name"
        />
      </div>

      <div>
        <label style={{ display: 'block', fontSize: '13px', color: '#333333', marginBottom: '6px', fontWeight: '500' }}>
          Phone
        </label>
        <input
          type="tel"
          value={phone}
          onChange={(e) => setPhone(e.target.value)}
          className="concierge-form-input"
          placeholder="Your phone number"
        />
      </div>

      <div>
        <label style={{ display: 'block', fontSize: '13px', color: '#333333', marginBottom: '6px', fontWeight: '500' }}>
          Email *
        </label>
        <input
          type="email"
          required
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          className="concierge-form-input"
          placeholder="your.email@example.com"
        />
      </div>

      <div>
        <label style={{ display: 'block', fontSize: '13px', color: '#333333', marginBottom: '6px', fontWeight: '500' }}>
          Message
        </label>
        <textarea
          rows={5}
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          className="concierge-form-input"
          style={{ resize: 'vertical' }}
          placeholder="How can we help you?"
        ></textarea>
      </div>

      <div style={{ marginTop: '0.5rem' }}>
        <button
          type="submit"
          disabled={status === 'submitting'}
          style={{
            backgroundColor: '#000000',
            color: '#ffffff',
            fontFamily: "'Montserrat', sans-serif",
            fontSize: '13px',
            fontWeight: '600',
            padding: '12px 28px',
            border: 'none',
            cursor: status === 'submitting' ? 'not-allowed' : 'pointer',
            opacity: status === 'submitting' ? 0.7 : 1,
            borderRadius: '1px',
          }}
        >
          {status === 'submitting' ? 'Submitting...' : 'Submit'}
        </button>
      </div>
    </form>
  )
}

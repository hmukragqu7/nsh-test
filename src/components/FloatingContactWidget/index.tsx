'use client'

import React, { useState } from 'react'

export const FloatingContactWidget: React.FC = () => {
  const [isOpen, setIsOpen] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    setSubmitting(true)

    const formData = new FormData(e.currentTarget)
    const name = formData.get('name') as string
    const phone = formData.get('phone') as string
    const email = formData.get('email') as string

    try {
      await fetch('/api/form-submissions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          form: '1',
          submissionData: [
            { field: 'name', value: name },
            { field: 'phone', value: phone },
            { field: 'email', value: email },
          ],
        }),
      })
    } catch (err) {
      console.error('Error submitting form to Payload CMS:', err)
    }

    setSubmitting(false)
    setSubmitted(true)
    setTimeout(() => {
      setSubmitted(false)
      setIsOpen(false)
    }, 3500)
  }

  return (
    <>
      {/* FLOATING RIGHT BUTTON */}
      {!isOpen && (
        <button
          onClick={() => setIsOpen(true)}
          aria-label="Connect With Us"
          style={{
            position: 'fixed',
            top: '50%',
            right: '-75px',
            transform: 'rotate(270deg)',
            backgroundColor: '#1a1a1a',
            color: '#ffffff',
            border: 'none',
            padding: '12px 22px',
            fontSize: '15px',
            fontWeight: 500,
            fontFamily: "'Montserrat', sans-serif",
            letterSpacing: '1px',
            cursor: 'pointer',
            zIndex: 9999,
            boxShadow: '0 4px 15px rgba(0,0,0,0.25)',
            whiteSpace: 'nowrap',
            transition: 'background-color 0.2s ease',
          }}
          className="nsh-floating-trigger-btn"
        >
          Connect With Us !
        </button>
      )}

      {/* OVERLAY BACKDROP FOR CLICK-OUTSIDE */}
      {isOpen && (
        <div
          onClick={() => setIsOpen(false)}
          style={{
            position: 'fixed',
            inset: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.25)',
            zIndex: 9998,
            backdropFilter: 'blur(2px)',
          }}
        />
      )}

      {/* FLOATING LEAD FORM MODAL */}
      <div
        style={{
          position: 'fixed',
          top: '50%',
          right: isOpen ? '24px' : '-500px',
          transform: 'translateY(-50%)',
          width: '380px',
          maxWidth: 'calc(100vw - 32px)',
          backgroundColor: '#ffffff',
          backgroundImage: 'url("/media/topography.svg")',
          backgroundSize: 'cover',
          backgroundPosition: 'center',
          boxShadow: '0 12px 40px rgba(0, 0, 0, 0.22)',
          zIndex: 10000,
          transition: 'right 0.4s cubic-bezier(0.16, 1, 0.3, 1)',
          padding: '32px 28px 28px 28px',
          boxSizing: 'border-box',
          border: '1px solid rgba(0, 0, 0, 0.08)',
        }}
      >
        {/* CLOSE X BUTTON */}
        <button
          onClick={() => setIsOpen(false)}
          aria-label="Close form"
          style={{
            position: 'absolute',
            top: 0,
            right: 0,
            width: '34px',
            height: '34px',
            backgroundColor: '#1a1a1a',
            color: '#ffffff',
            border: 'none',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            fontSize: '16px',
            lineHeight: 1,
            transition: 'background-color 0.2s ease',
          }}
          className="nsh-floating-close-btn"
        >
          ✕
        </button>

        {/* FORM CONTENT */}
        <div style={{ position: 'relative', zIndex: 2 }}>
          {/* TITLE */}
          <h3
            style={{
              fontFamily: "'Cormorant Garamond', Georgia, serif",
              fontSize: '2rem',
              fontWeight: 500,
              color: '#1a1a1a',
              margin: 0,
              paddingBottom: '10px',
              borderBottom: '1px solid #1a1a1a',
              lineHeight: 1.2,
            }}
          >
            Contact Us
          </h3>

          {submitted ? (
            <div style={{ padding: '30px 0', textAlign: 'center' }}>
              <p
                style={{
                  fontFamily: "'Montserrat', sans-serif",
                  fontSize: '1rem',
                  color: '#166534',
                  fontWeight: 600,
                  margin: 0,
                }}
              >
                Thank you! Your message has been sent.
              </p>
            </div>
          ) : (
            <form
              onSubmit={handleSubmit}
              style={{
                marginTop: '20px',
                display: 'flex',
                flexDirection: 'column',
                gap: '14px',
              }}
            >
              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '4px',
                    color: '#1a1a1a',
                  }}
                >
                  Name<span style={{ color: 'red' }}>*</span>
                </label>
                <input
                  type="text"
                  name="name"
                  required
                  style={{
                    width: '100%',
                    height: '42px',
                    padding: '0 12px',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.9rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '4px',
                    color: '#1a1a1a',
                  }}
                >
                  Phone
                </label>
                <input
                  type="tel"
                  name="phone"
                  style={{
                    width: '100%',
                    height: '42px',
                    padding: '0 12px',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.9rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div>
                <label
                  style={{
                    display: 'block',
                    fontFamily: "'Montserrat', sans-serif",
                    fontSize: '0.85rem',
                    fontWeight: 500,
                    marginBottom: '4px',
                    color: '#1a1a1a',
                  }}
                >
                  Email<span style={{ color: 'red' }}>*</span>
                </label>
                <input
                  type="email"
                  name="email"
                  required
                  style={{
                    width: '100%',
                    height: '42px',
                    padding: '0 12px',
                    backgroundColor: '#ebebeb',
                    border: 'none',
                    borderRadius: '0px',
                    fontSize: '0.9rem',
                    fontFamily: "'Montserrat', sans-serif",
                    color: '#1a1a1a',
                    outline: 'none',
                    boxSizing: 'border-box',
                  }}
                />
              </div>

              <div style={{ marginTop: '6px' }}>
                <button
                  type="submit"
                  disabled={submitting}
                  style={{
                    backgroundColor: '#000000',
                    color: '#ffffff',
                    border: 'none',
                    padding: '12px 36px',
                    fontSize: '0.85rem',
                    fontWeight: 600,
                    fontFamily: "'Montserrat', sans-serif",
                    borderRadius: '0px',
                    cursor: 'pointer',
                    letterSpacing: '0.5px',
                    transition: 'background-color 0.2s ease',
                  }}
                  className="nsh-floating-submit-btn"
                >
                  {submitting ? 'Sending...' : 'Submit'}
                </button>
              </div>
            </form>
          )}
        </div>
      </div>

      <style jsx global>{`
        .nsh-floating-trigger-btn:hover {
          background-color: #333333 !important;
        }
        .nsh-floating-close-btn:hover {
          background-color: #333333 !important;
        }
        .nsh-floating-submit-btn:hover {
          background-color: #262626 !important;
        }
      `}</style>
    </>
  )
}

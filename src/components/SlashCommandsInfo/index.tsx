import React from 'react'

export const SlashCommandsInfo: React.FC = () => {
  return (
    <div
      style={{
        marginTop: '1.5rem',
        padding: '1.25rem',
        backgroundColor: '#f8fafc',
        border: '1px solid #cbd5e1',
        borderRadius: '6px',
        fontSize: '0.82rem',
        color: '#334155',
        fontFamily: 'system-ui, -apple-system, sans-serif',
      }}
    >
      <h4
        style={{
          fontSize: '0.88rem',
          fontWeight: '700',
          color: '#0f172a',
          margin: '0 0 0.6rem',
          letterSpacing: '0.3px',
        }}
      >
        💡 Editor Slash Commands Guide
      </h4>
      <p style={{ margin: '0 0 0.6rem', fontSize: '0.78rem', color: '#64748b' }}>
        Type <strong style={{ color: '#0f172a' }}>/</strong> on a new line inside Content to insert:
      </p>

      <ul
        style={{
          paddingLeft: '1rem',
          margin: 0,
          display: 'flex',
          flexDirection: 'column',
          gap: '0.35rem',
          lineHeight: '1.4',
        }}
      >
        <li>
          <strong>/media</strong> — Image with Caption
        </li>
        <li>
          <strong>/banner</strong> — Callout / Info Box
        </li>
        <li>
          <strong>/code</strong> — Code Block
        </li>
        <li>
          <strong>/h1, /h2, /h3</strong> — Headings
        </li>
        <li>
          <strong>/bullet, /number</strong> — Lists
        </li>
        <li>
          <strong>/quote</strong> — Blockquote / Pull Quote
        </li>
        <li>
          <strong>/hr</strong> — Divider line
        </li>
        <li>
          <strong>Ctrl + K</strong> — Add Link to highlighted word
        </li>
      </ul>
    </div>
  )
}

export default SlashCommandsInfo

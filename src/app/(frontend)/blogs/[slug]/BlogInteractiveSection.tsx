'use client'

import React, { useState } from 'react'

interface CommentItem {
  id: string
  name: string
  date: string
  comment: string
}

interface BlogInteractiveSectionProps {
  title: string
  ctaText?: string
  ctaLinkText?: string
  ctaLinkUrl?: string
}

export default function BlogInteractiveSection({
  title,
  ctaText,
  ctaLinkText,
  ctaLinkUrl,
}: BlogInteractiveSectionProps) {
  const [comments, setComments] = useState<CommentItem[]>([])
  const [commentText, setCommentText] = useState('')
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [copied, setCopied] = useState(false)
  const [submittedMessage, setSubmittedMessage] = useState(false)

  const ctaLabel = ctaText || 'Browse all Novel Signature Homes listings in Houston →'
  const ctaBtnLabel = ctaLinkText || 'View All Properties'
  const ctaUrl = ctaLinkUrl || '/properties'

  const [shareUrl, setShareUrl] = useState('')

  React.useEffect(() => {
    setShareUrl(window.location.href)
  }, [])

  const handleShare = async () => {
    if (typeof window !== 'undefined' && navigator.share) {
      try {
        await navigator.share({
          title,
          url: shareUrl,
        })
      } catch (err) {
        navigator.clipboard.writeText(shareUrl)
        setCopied(true)
        setTimeout(() => setCopied(false), 2500)
      }
    } else if (typeof window !== 'undefined') {
      navigator.clipboard.writeText(shareUrl)
      setCopied(true)
      setTimeout(() => setCopied(false), 2500)
    }
  }

  const handleSubmitComment = (e: React.FormEvent) => {
    e.preventDefault()
    if (!commentText.trim()) return

    const newComment: CommentItem = {
      id: Date.now().toString(),
      name: name.trim() || 'Guest Reader',
      date: new Date().toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric',
      }),
      comment: commentText.trim(),
    }

    setComments((prev) => [newComment, ...prev])
    setCommentText('')
    setName('')
    setEmail('')
    setSubmittedMessage(true)
    setTimeout(() => setSubmittedMessage(false), 4000)
  }

  return (
    <div className="my-14">
      {/* Top CTA Bar */}
      <div className="nsh-cta-bar">
        {ctaLabel}{' '}
        <a href={ctaUrl} className="nsh-cta-link">
          {ctaBtnLabel}
        </a>
      </div>

      {/* Share Section */}
      <div className="mb-14">
        <h3 className="nsh-share-title">Like what you read? Share it.</h3>

        <div className="nsh-share-row">
          {/* LinkedIn Icon (Blue Square) */}
          <a
            href={`https://www.linkedin.com/shareArticle?mini=true&url=${encodeURIComponent(shareUrl)}&title=${encodeURIComponent(title)}&source=Novel+Signature+Homes`}
            target="_blank"
            rel="noopener noreferrer"
            title="Share on LinkedIn"
            className="nsh-share-icon-linkedin"
          >
            <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
              <path d="M19 3a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14m-.5 15.5v-5.3a3.26 3.26 0 0 0-3.26-3.26c-.85 0-1.84.52-2.28 1.3v-1.11h-2.79v8.37h2.79v-4.93c0-.77.62-1.4 1.39-1.4a1.4 1.4 0 0 1 1.4 1.4v4.93h2.75M6.46 10.9v8.37H9.25V10.9H6.46M7.86 6.78a1.63 1.63 0 1 0 0 3.26 1.63 1.63 0 0 0 0-3.26Z" />
            </svg>
          </a>

          {/* X / Twitter Icon (Black Circle) */}
          <a
            href={`http://twitter.com/share?url=${encodeURIComponent(shareUrl)}&text=${encodeURIComponent(title)}&hashtags=Uncategorized`}
            target="_blank"
            rel="noopener noreferrer"
            title="Share on X"
            className="nsh-share-icon-twitter"
          >
            <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
              <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
            </svg>
          </a>

          {/* Facebook Icon (Blue Circle) */}
          <a
            href={`https://www.facebook.com/sharer.php?u=${encodeURIComponent(shareUrl)}`}
            target="_blank"
            rel="noopener noreferrer"
            title="Share on Facebook"
            className="nsh-share-icon-facebook"
          >
            <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
              <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
            </svg>
          </a>

          {/* Share Button (Black Box) */}
          <button onClick={handleShare} className="nsh-share-btn-black">
            <svg
              width="13"
              height="13"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
            >
              <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8" />
              <polyline points="16 6 12 2 8 6" />
              <line x1="12" y1="2" x2="12" y2="15" />
            </svg>
            {copied ? 'Copied!' : 'Share'}
          </button>
        </div>
      </div>

      {/* Leave a Comment Section */}
      <div>
        <h3 className="nsh-comment-heading">Leave a Comment</h3>

        <p className="nsh-comment-subtext">
          Required fields are marked <span className="text-red-500">*</span>
        </p>

        {submittedMessage && (
          <div className="bg-green-50 text-green-800 border border-green-200 p-3 rounded-xs mb-4 text-xs font-medium">
            Comment posted successfully!
          </div>
        )}

        <form onSubmit={handleSubmitComment} className="flex flex-col gap-4">
          <textarea
            rows={1}
            required
            value={commentText}
            onChange={(e) => setCommentText(e.target.value)}
            placeholder="Comment your thoughts..."
            className="nsh-form-textarea"
          />

          <div>
            <button type="submit" className="nsh-btn-submit">
              Post Comment
            </button>
          </div>
        </form>

        {/* Dynamic Comments List */}
        {comments.length > 0 && (
          <div className="mt-8 flex flex-col gap-5">
            {comments.map((c) => (
              <div key={c.id} className="nsh-comment-card">
                <div className="flex justify-between mb-1.5">
                  <span className="font-semibold text-sm text-[#1a1a1a]">{c.name}</span>
                  <span className="text-xs text-gray-500">{c.date}</span>
                </div>
                <p className="text-sm text-gray-700 m-0 leading-relaxed">{c.comment}</p>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

import React from 'react'

export default function Loading() {
  return (
    <div className="w-full min-h-[60vh] flex flex-col items-center justify-center py-20 px-4">
      {/* Luxury gold brand loading spinner */}
      <div className="relative flex items-center justify-center">
        <div className="w-14 h-14 rounded-full border-2 border-[#C5A880]/20 border-t-[#C5A880] animate-spin" />
        <div className="absolute w-8 h-8 rounded-full border-2 border-[#C5A880]/10 border-b-[#C5A880] animate-spin [animation-direction:reverse] [animation-duration:1.5s]" />
      </div>
      <p className="mt-4 text-xs uppercase tracking-widest text-neutral-400 font-medium">
        Loading...
      </p>
    </div>
  )
}

'use client'

import React, { useState, useEffect, useCallback } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import type { CarouselBlock as CarouselBlockProps } from '@/payload-types'
import { Media } from '@/components/Media'
import { cn } from '@/utilities/ui'

type Props = CarouselBlockProps & {
  className?: string
  disableInnerContainer?: boolean
}

export const CarouselBlock: React.FC<Props> = (props) => {
  const { title, slides = [], className } = props
  const [currentIndex, setCurrentIndex] = useState(0)

  const prevSlide = () => {
    setCurrentIndex((prev) => (prev === 0 ? (slides?.length || 1) - 1 : prev - 1))
  }

  const nextSlide = useCallback(() => {
    setCurrentIndex((prev) => (prev === (slides?.length || 1) - 1 ? 0 : prev + 1))
  }, [slides?.length])

  // Auto-play interval
  useEffect(() => {
    if (!slides || slides.length <= 1) return
    const timer = setInterval(() => {
      nextSlide()
    }, 5000)
    return () => clearInterval(timer)
  }, [nextSlide, slides])

  if (!slides || slides.length === 0) return null

  return (
    <section className={cn('container mx-auto px-4 py-8', className)}>
      {title && <h2 className="text-3xl font-bold text-center mb-6">{title}</h2>}

      <div className="relative overflow-hidden rounded-2xl shadow-xl bg-card border border-border group aspect-[16/9] md:aspect-[21/9]">
        {/* Slides */}
        {slides.map((slide, index) => {
          const isCurrent = index === currentIndex

          return (
            <div
              key={slide.id || index}
              className={cn(
                'absolute inset-0 transition-opacity duration-700 ease-in-out',
                isCurrent ? 'opacity-100 z-10' : 'opacity-0 z-0 pointer-events-none',
              )}
            >
              {slide.image && (
                <Media
                  resource={slide.image}
                  fill
                  imgClassName="object-cover w-full h-full"
                  priority={index === 0}
                />
              )}

              {/* Dark Gradient Overlay for legible text */}
              <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent pointer-events-none z-10" />

              {/* Caption & Heading */}
              {(slide.heading || slide.caption) && (
                <div className="absolute bottom-0 left-0 right-0 p-6 md:p-12 text-white z-20">
                  {slide.heading && (
                    <h3 className="text-2xl md:text-4xl font-bold mb-2 tracking-tight">
                      {slide.heading}
                    </h3>
                  )}
                  {slide.caption && (
                    <p className="text-sm md:text-lg text-slate-200 max-w-2xl leading-relaxed">
                      {slide.caption}
                    </p>
                  )}
                </div>
              )}
            </div>
          )
        })}

        {/* Navigation Arrows */}
        {slides.length > 1 && (
          <>
            <button
              onClick={prevSlide}
              aria-label="Previous slide"
              type="button"
              className="absolute left-4 top-1/2 -translate-y-1/2 z-30 p-2.5 rounded-full bg-black/40 text-white hover:bg-black/70 backdrop-blur-sm transition-all duration-200 opacity-0 group-hover:opacity-100 focus:opacity-100"
            >
              <ChevronLeft className="w-6 h-6" />
            </button>

            <button
              onClick={nextSlide}
              aria-label="Next slide"
              type="button"
              className="absolute right-4 top-1/2 -translate-y-1/2 z-30 p-2.5 rounded-full bg-black/40 text-white hover:bg-black/70 backdrop-blur-sm transition-all duration-200 opacity-0 group-hover:opacity-100 focus:opacity-100"
            >
              <ChevronRight className="w-6 h-6" />
            </button>
          </>
        )}

        {/* Navigation Dots */}
        {slides.length > 1 && (
          <div className="absolute bottom-4 right-6 z-30 flex items-center space-x-2">
            {slides.map((_, index) => (
              <button
                key={index}
                onClick={() => setCurrentIndex(index)}
                aria-label={`Go to slide ${index + 1}`}
                type="button"
                className={cn(
                  'h-2.5 rounded-full transition-all duration-300',
                  index === currentIndex
                    ? 'w-8 bg-white'
                    : 'w-2.5 bg-white/50 hover:bg-white/80',
                )}
              />
            ))}
          </div>
        )}
      </div>
    </section>
  )
}

import type { CollectionBeforeChangeHook } from 'payload'
import { calculateReadingTime } from '../utilities/calculateReadingTime'

/**
 * Payload beforeChange hook that automatically calculates and sets `readingTime`
 * based on the readable words in the `content` field.
 */
export const updateReadingTime: CollectionBeforeChangeHook = ({ data }) => {
  if (data) {
    const readingTime = calculateReadingTime(data.content)
    data.readingTime = readingTime
  }
  return data
}

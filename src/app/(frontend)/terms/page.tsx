import { redirect } from 'next/navigation'

export const dynamic = 'force-dynamic'

export default function TermsRedirectPage() {
  redirect('/terms-and-conditions')
}

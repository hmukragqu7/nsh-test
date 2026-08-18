import 'dotenv/config'
import { createClient } from '@libsql/client'

async function addPrivacyDbColumns() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const colNames = [
    'title',
    'effective_date',
    'intro_title',
    'intro_content',
    'info_collect_title',
    'info_collect_content',
    'how_use_title',
    'how_use_content',
    'legal_bases_title',
    'legal_bases_content',
    'disclosure_title',
    'disclosure_content',
    'cookies_title',
    'cookies_content',
    'data_retention_title',
    'data_retention_content',
    'security_title',
    'security_content',
    'transfers_title',
    'transfers_content',
    'your_rights_title',
    'your_rights_content',
    'gdpr_rights_title',
    'gdpr_rights_content',
    'ccpa_rights_title',
    'ccpa_rights_content',
    'contact_title',
    'contact_content',
  ]

  for (const name of colNames) {
    const colName = `privacy_policy_page_${name}`
    const verColName = `version_privacy_policy_page_${name}`

    try {
      await db.execute(`ALTER TABLE \`pages\` ADD COLUMN \`${colName}\` TEXT`)
      console.log(`Added column ${colName} to pages`)
    } catch (err: any) {
      console.log(`Column ${colName} note:`, err?.message || err)
    }

    try {
      await db.execute(`ALTER TABLE \`_pages_v\` ADD COLUMN \`${verColName}\` TEXT`)
      console.log(`Added column ${verColName} to _pages_v`)
    } catch (err: any) {
      console.log(`Column ${verColName} note:`, err?.message || err)
    }
  }

  console.log('Finished adding privacy columns to SQLite database.')
  process.exit(0)
}

addPrivacyDbColumns().catch((err) => {
  console.error('Error adding privacy columns:', err)
  process.exit(1)
})

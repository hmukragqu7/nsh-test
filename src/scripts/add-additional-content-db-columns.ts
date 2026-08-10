import 'dotenv/config'
import { createClient } from '@libsql/client'

async function addAdditionalContentDbColumns() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const cols = [
    'buy_a_home_page_additional_content',
    'other_inquiries_page_additional_content',
    'trade_inquiry_page_additional_content',
  ]

  for (const colName of cols) {
    const verColName = `version_${colName}`

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

  console.log('Finished adding additionalContent columns to SQLite database.')
  process.exit(0)
}

addAdditionalContentDbColumns().catch((err) => {
  console.error('Error adding columns:', err)
  process.exit(1)
})

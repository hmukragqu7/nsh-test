import 'dotenv/config'
import { createClient } from '@libsql/client'

async function addSelectedFormDbColumns() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const cols = [
    'buy_a_home_page_selected_form_id',
    'other_inquiries_page_selected_form_id',
    'trade_inquiry_page_selected_form_id',
  ]

  for (const colName of cols) {
    const verColName = `version_${colName}`

    try {
      await db.execute(`ALTER TABLE \`pages\` ADD COLUMN \`${colName}\` INTEGER`)
      console.log(`Added column ${colName} to pages`)
    } catch (err: any) {
      console.log(`Column ${colName} note:`, err?.message || err)
    }

    try {
      await db.execute(`ALTER TABLE \`_pages_v\` ADD COLUMN \`${verColName}\` INTEGER`)
      console.log(`Added column ${verColName} to _pages_v`)
    } catch (err: any) {
      console.log(`Column ${verColName} note:`, err?.message || err)
    }
  }

  // Also check pages_rels table for forms_id column if relationship table is used
  try {
    await db.execute(`ALTER TABLE \`pages_rels\` ADD COLUMN \`forms_id\` INTEGER`)
    console.log(`Added column forms_id to pages_rels`)
  } catch (err: any) {
    console.log(`pages_rels forms_id note:`, err?.message || err)
  }

  try {
    await db.execute(`ALTER TABLE \`_pages_v_rels\` ADD COLUMN \`forms_id\` INTEGER`)
    console.log(`Added column forms_id to _pages_v_rels`)
  } catch (err: any) {
    console.log(`_pages_v_rels forms_id note:`, err?.message || err)
  }

  console.log('Finished adding selectedForm relationship columns.')
  process.exit(0)
}

addSelectedFormDbColumns().catch((err) => {
  console.error('Error adding columns:', err)
  process.exit(1)
})

import 'dotenv/config'
import { createClient } from '@libsql/client'

async function addOtherPagesDbColumns() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const columns = [
    // Buy A Home
    { name: 'buy_a_home_page_title', type: 'TEXT' },
    { name: 'buy_a_home_page_subheading', type: 'TEXT' },
    { name: 'buy_a_home_page_description', type: 'TEXT' },
    { name: 'buy_a_home_page_image_id', type: 'INTEGER' },
    { name: 'buy_a_home_page_image_url', type: 'TEXT' },
    { name: 'buy_a_home_page_form_action', type: 'TEXT' },
    { name: 'buy_a_home_page_button_text', type: 'TEXT' },

    // Other Inquiries
    { name: 'other_inquiries_page_title', type: 'TEXT' },
    { name: 'other_inquiries_page_subheading', type: 'TEXT' },
    { name: 'other_inquiries_page_description', type: 'TEXT' },
    { name: 'other_inquiries_page_image_id', type: 'INTEGER' },
    { name: 'other_inquiries_page_image_url', type: 'TEXT' },
    { name: 'other_inquiries_page_form_action', type: 'TEXT' },
    { name: 'other_inquiries_page_button_text', type: 'TEXT' },

    // Trade Inquiry
    { name: 'trade_inquiry_page_title', type: 'TEXT' },
    { name: 'trade_inquiry_page_subheading', type: 'TEXT' },
    { name: 'trade_inquiry_page_description', type: 'TEXT' },
    { name: 'trade_inquiry_page_image_id', type: 'INTEGER' },
    { name: 'trade_inquiry_page_image_url', type: 'TEXT' },
    { name: 'trade_inquiry_page_form_action', type: 'TEXT' },
    { name: 'trade_inquiry_page_button_text', type: 'TEXT' },

    // Thank You
    { name: 'thank_you_page_title', type: 'TEXT' },
    { name: 'thank_you_page_subheading', type: 'TEXT' },
    { name: 'thank_you_page_message', type: 'TEXT' },
    { name: 'thank_you_page_button_text', type: 'TEXT' },
    { name: 'thank_you_page_button_link', type: 'TEXT' },
  ]

  for (const col of columns) {
    const colName = col.name
    const verColName = `version_${col.name}`

    try {
      await db.execute(`ALTER TABLE \`pages\` ADD COLUMN \`${colName}\` ${col.type}`)
      console.log(`Added column ${colName} to pages`)
    } catch (err: any) {
      console.log(`Column ${colName} note:`, err?.message || err)
    }

    try {
      await db.execute(`ALTER TABLE \`_pages_v\` ADD COLUMN \`${verColName}\` ${col.type}`)
      console.log(`Added column ${verColName} to _pages_v`)
    } catch (err: any) {
      console.log(`Column ${verColName} note:`, err?.message || err)
    }
  }

  console.log('Finished adding columns for Buy A Home, Other Inquiries, Trade Inquiry, Thank You pages.')
  process.exit(0)
}

addOtherPagesDbColumns().catch((err) => {
  console.error('Error adding columns:', err)
  process.exit(1)
})

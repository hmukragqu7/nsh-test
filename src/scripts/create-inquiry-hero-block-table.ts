import 'dotenv/config'
import { createClient } from '@libsql/client'

async function createInquiryHeroBlockTables() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  // Table 1: pages_blocks_inquiry_hero
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`pages_blocks_inquiry_hero\` (
        \`_order\` INTEGER NOT NULL,
        \`_parent_id\` INTEGER NOT NULL,
        \`_path\` TEXT NOT NULL,
        \`id\` TEXT PRIMARY KEY,
        \`title\` TEXT,
        \`subheading\` TEXT,
        \`description\` TEXT,
        \`image_id\` INTEGER,
        \`image_url\` TEXT,
        \`additional_content\` TEXT,
        \`selected_form_id\` INTEGER,
        \`form_action\` TEXT,
        \`button_text\` TEXT,
        \`block_name\` TEXT,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE CASCADE
      )
    `)
    console.log('Created table pages_blocks_inquiry_hero')
  } catch (err: any) {
    console.log('pages_blocks_inquiry_hero note:', err?.message || err)
  }

  // Table 2: _pages_v_version_blocks_inquiry_hero
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`_pages_v_version_blocks_inquiry_hero\` (
        \`_order\` INTEGER NOT NULL,
        \`_parent_id\` INTEGER NOT NULL,
        \`_path\` TEXT NOT NULL,
        \`id\` TEXT,
        \`title\` TEXT,
        \`subheading\` TEXT,
        \`description\` TEXT,
        \`image_id\` INTEGER,
        \`image_url\` TEXT,
        \`additional_content\` TEXT,
        \`selected_form_id\` INTEGER,
        \`form_action\` TEXT,
        \`button_text\` TEXT,
        \`block_name\` TEXT,
        \`_version_order\` INTEGER NOT NULL,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE CASCADE
      )
    `)
    console.log('Created table _pages_v_version_blocks_inquiry_hero')
  } catch (err: any) {
    console.log('_pages_v_version_blocks_inquiry_hero note:', err?.message || err)
  }

  console.log('Finished creating InquiryHero block SQLite tables.')
  process.exit(0)
}

createInquiryHeroBlockTables().catch((err) => {
  console.error('Error creating tables:', err)
  process.exit(1)
})

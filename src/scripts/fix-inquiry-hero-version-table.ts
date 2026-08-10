import 'dotenv/config'
import { createClient } from '@libsql/client'

async function fixInquiryHeroVersionTable() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`_pages_v_blocks_inquiry_hero\` (
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
        \`_uuid\` TEXT,
        \`block_name\` TEXT,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE CASCADE
      )
    `)
    console.log('Created table _pages_v_blocks_inquiry_hero successfully!')
  } catch (err: any) {
    console.log('_pages_v_blocks_inquiry_hero table note:', err?.message || err)
  }

  process.exit(0)
}

fixInquiryHeroVersionTable().catch((err) => {
  console.error('Error fixing version table:', err)
  process.exit(1)
})

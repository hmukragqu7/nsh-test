import 'dotenv/config'
import { createClient } from '@libsql/client'

async function createPrivacySectionsTable() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  // Drop version table to recreate with correct nullable id column
  try {
    await db.execute(`DROP TABLE IF EXISTS \`_pages_v_version_privacy_policy_page_sections\`;`)
    console.log('Dropped old version array table.')
  } catch (err) {}

  // Table 1: pages_privacy_policy_page_sections
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`pages_privacy_policy_page_sections\` (
        \`_order\` integer NOT NULL,
        \`_parent_id\` integer NOT NULL,
        \`id\` text PRIMARY KEY NOT NULL,
        \`heading\` text NOT NULL,
        \`content\` text,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE cascade ON UPDATE no action
      );
    `)
    console.log('Created pages_privacy_policy_page_sections table.')
  } catch (err: any) {
    console.error('Error creating pages_privacy_policy_page_sections:', err?.message || err)
  }

  // Table 2: _pages_v_version_privacy_policy_page_sections (id is nullable)
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`_pages_v_version_privacy_policy_page_sections\` (
        \`_order\` integer NOT NULL,
        \`_parent_id\` integer NOT NULL,
        \`id\` text,
        \`heading\` text,
        \`version_heading\` text,
        \`content\` text,
        \`version_content\` text,
        \`_uuid\` text,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE cascade ON UPDATE no action
      );
    `)
    console.log('Created _pages_v_version_privacy_policy_page_sections table with nullable id.')
  } catch (err: any) {
    console.error('Error creating _pages_v_version_privacy_policy_page_sections:', err?.message || err)
  }

  console.log('Finished setting up array tables for Privacy Policy sections.')
  process.exit(0)
}

createPrivacySectionsTable().catch((err) => {
  console.error('Error setting up tables:', err)
  process.exit(1)
})

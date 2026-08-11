import 'dotenv/config'
import { createClient } from '@libsql/client'

async function createTermsDbSchema() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  // 1. Add columns to `pages` and `_pages_v`
  const colNames = ['title', 'subheading', 'effective_date']
  for (const name of colNames) {
    const colName = `terms_and_conditions_page_${name}`
    const verColName = `version_terms_and_conditions_page_${name}`

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

  // 2. Drop old version array table if exists
  try {
    await db.execute(`DROP TABLE IF EXISTS \`_pages_v_version_terms_and_conditions_page_sections\`;`)
  } catch (err) {}

  // 3. Create pages_terms_and_conditions_page_sections table
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`pages_terms_and_conditions_page_sections\` (
        \`_order\` integer NOT NULL,
        \`_parent_id\` integer NOT NULL,
        \`id\` text PRIMARY KEY NOT NULL,
        \`heading\` text NOT NULL,
        \`content\` text,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE cascade ON UPDATE no action
      );
    `)
    console.log('Created pages_terms_and_conditions_page_sections table.')
  } catch (err: any) {
    console.error('Error creating pages_terms_and_conditions_page_sections:', err?.message || err)
  }

  // 4. Create _pages_v_version_terms_and_conditions_page_sections table
  try {
    await db.execute(`
      CREATE TABLE IF NOT EXISTS \`_pages_v_version_terms_and_conditions_page_sections\` (
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
    console.log('Created _pages_v_version_terms_and_conditions_page_sections table.')
  } catch (err: any) {
    console.error('Error creating _pages_v_version_terms_and_conditions_page_sections:', err?.message || err)
  }

  console.log('Finished setting up database schema for Terms & Conditions.')
  process.exit(0)
}

createTermsDbSchema().catch((err) => {
  console.error('Error creating terms DB schema:', err)
  process.exit(1)
})

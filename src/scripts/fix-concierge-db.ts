import { createClient } from '@libsql/client'

async function fixConciergeDb() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const columns = [
    { table: 'pages', name: 'concierge_page_hero_title', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_hero_description', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_hero_banner_image', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_services_heading', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_how_it_works_heading', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_how_it_works_image', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_why_love_it_heading', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_contact_form_heading', type: 'TEXT' },
    { table: 'pages', name: 'concierge_page_contact_form_subheading', type: 'TEXT' },

    { table: '_pages_v', name: 'version_concierge_page_hero_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_hero_description', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_hero_banner_image', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_services_heading', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_how_it_works_heading', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_how_it_works_image', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_why_love_it_heading', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_contact_form_heading', type: 'TEXT' },
    { table: '_pages_v', name: 'version_concierge_page_contact_form_subheading', type: 'TEXT' },
  ]

  for (const col of columns) {
    try {
      await db.execute(`ALTER TABLE \`${col.table}\` ADD COLUMN \`${col.name}\` ${col.type}`)
      console.log(`Added column ${col.name} to ${col.table}`)
    } catch (err: any) {
      if (err?.message?.includes('duplicate column name') || err?.rawCode === 1) {
        console.log(`Column ${col.name} already exists in ${col.table}`)
      } else {
        console.error(`Error adding column ${col.name} to ${col.table}:`, err?.message || err)
      }
    }
  }

  // Drop array tables to recreate with correct nullable id definitions
  const dropTables = [
    'DROP TABLE IF EXISTS `pages_concierge_page_services_items`;',
    'DROP TABLE IF EXISTS `_pages_v_version_concierge_page_services_items`;',
    'DROP TABLE IF EXISTS `pages_concierge_page_how_it_works_steps`;',
    'DROP TABLE IF EXISTS `_pages_v_version_concierge_page_how_it_works_steps`;',
    'DROP TABLE IF EXISTS `pages_concierge_page_why_love_it_cards`;',
    'DROP TABLE IF EXISTS `_pages_v_version_concierge_page_why_love_it_cards`;',
  ]
  for (const dropQuery of dropTables) {
    try {
      await db.execute(dropQuery)
    } catch (e) {}
  }

  // Create array tables
  const createTableQueries = [
    `CREATE TABLE \`pages_concierge_page_services_items\` (
      \`id\` text PRIMARY KEY NOT NULL,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`title\` text,
      \`icon\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE cascade
    );`,
    `CREATE TABLE \`_pages_v_version_concierge_page_services_items\` (
      \`id\` text,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`title\` text,
      \`icon\` text,
      \`_uuid\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE cascade
    );`,
    `CREATE TABLE \`pages_concierge_page_how_it_works_steps\` (
      \`id\` text PRIMARY KEY NOT NULL,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`step_number\` text,
      \`title\` text,
      \`description\` text,
      \`icon\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE cascade
    );`,
    `CREATE TABLE \`_pages_v_version_concierge_page_how_it_works_steps\` (
      \`id\` text,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`step_number\` text,
      \`title\` text,
      \`description\` text,
      \`icon\` text,
      \`_uuid\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE cascade
    );`,
    `CREATE TABLE \`pages_concierge_page_why_love_it_cards\` (
      \`id\` text PRIMARY KEY NOT NULL,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`tag\` text,
      \`description\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`pages\`(\`id\`) ON DELETE cascade
    );`,
    `CREATE TABLE \`_pages_v_version_concierge_page_why_love_it_cards\` (
      \`id\` text,
      \`_order\` integer NOT NULL,
      \`_parent_id\` integer NOT NULL,
      \`tag\` text,
      \`description\` text,
      \`_uuid\` text,
      FOREIGN KEY (\`_parent_id\`) REFERENCES \`_pages_v\`(\`id\`) ON DELETE cascade
    );`,
  ]

  for (const q of createTableQueries) {
    try {
      await db.execute(q)
      console.log('Created array table if not exists.')
    } catch (err: any) {
      console.error('Error creating table:', err?.message || err)
    }
  }

  process.exit(0)
}

fixConciergeDb().catch((err) => {
  console.error('Error fixing Concierge DB schema:', err)
  process.exit(1)
})

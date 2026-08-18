import { createClient } from '@libsql/client'

async function fixDbSchema() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const columns = [
    { table: 'pages', name: 'properties_page_header_title', type: 'TEXT' },
    { table: 'pages', name: 'properties_page_header_description', type: 'TEXT' },
    { table: 'pages', name: 'properties_page_header_section_heading', type: 'TEXT' },
    { table: '_pages_v', name: 'version_properties_page_header_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_properties_page_header_description', type: 'TEXT' },
    { table: '_pages_v', name: 'version_properties_page_header_section_heading', type: 'TEXT' },
    { table: 'blogs', name: 'read_time', type: 'TEXT' },
    { table: '_blogs_v', name: 'version_read_time', type: 'TEXT' },
  ]

  for (const col of columns) {
    try {
      await db.execute(`ALTER TABLE \`${col.table}\` ADD COLUMN \`${col.name}\` ${col.type}`)
      console.log(`Successfully added column ${col.name} to ${col.table}`)
    } catch (err: any) {
      if (err?.message?.includes('duplicate column name') || err?.rawCode === 1) {
        console.log(`Column ${col.name} already exists in ${col.table}`)
      } else {
        console.error(`Error adding column ${col.name} to ${col.table}:`, err?.message || err)
      }
    }
  }

  process.exit(0)
}

fixDbSchema().catch((err) => {
  console.error('Error fixing DB schema:', err)
  process.exit(1)
})

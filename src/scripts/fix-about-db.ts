import { createClient } from '@libsql/client'

async function fixAboutDb() {
  const db = createClient({
    url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
  })

  const columns = [
    { table: 'pages', name: 'about_page_story_title', type: 'TEXT' },
    { table: 'pages', name: 'about_page_banner_image', type: 'TEXT' },
    { table: 'pages', name: 'about_page_paragraph1', type: 'TEXT' },
    { table: 'pages', name: 'about_page_paragraph2', type: 'TEXT' },
    { table: 'pages', name: 'about_page_vision_title', type: 'TEXT' },
    { table: 'pages', name: 'about_page_vision_text', type: 'TEXT' },
    { table: 'pages', name: 'about_page_mission_title', type: 'TEXT' },
    { table: 'pages', name: 'about_page_mission_text', type: 'TEXT' },
    { table: 'pages', name: 'about_page_values_title', type: 'TEXT' },
    { table: 'pages', name: 'about_page_values_text', type: 'TEXT' },
    { table: 'pages', name: 'about_page_why_heading_prefix', type: 'TEXT' },
    { table: 'pages', name: 'about_page_why_heading_main', type: 'TEXT' },
    { table: 'pages', name: 'about_page_why_subtitle', type: 'TEXT' },
    { table: 'pages', name: 'about_page_why_image', type: 'TEXT' },
    { table: 'pages', name: 'about_page_feature1', type: 'TEXT' },
    { table: 'pages', name: 'about_page_feature2', type: 'TEXT' },
    { table: 'pages', name: 'about_page_feature3', type: 'TEXT' },
    { table: 'pages', name: 'about_page_feature4', type: 'TEXT' },
    { table: 'pages', name: 'about_page_contact_heading', type: 'TEXT' },

    { table: '_pages_v', name: 'version_about_page_story_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_banner_image', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_paragraph1', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_paragraph2', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_vision_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_vision_text', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_mission_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_mission_text', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_values_title', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_values_text', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_why_heading_prefix', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_why_heading_main', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_why_subtitle', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_why_image', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_feature1', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_feature2', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_feature3', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_feature4', type: 'TEXT' },
    { table: '_pages_v', name: 'version_about_page_contact_heading', type: 'TEXT' },
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

  console.log('About DB Schema updated successfully!')
  process.exit(0)
}

fixAboutDb().catch((err) => {
  console.error('Error fixing About DB schema:', err)
  process.exit(1)
})

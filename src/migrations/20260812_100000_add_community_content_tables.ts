import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-sqlite'

/**
 * Migration to add Community Content fields and neighborhood_accordion table for properties.
 */
export async function up({ db }: MigrateUpArgs): Promise<void> {
  const mainTables = ['properties', '_properties_v']

  for (const table of mainTables) {
    const prefix = table.startsWith('_') ? 'version_' : ''

    // Project Team
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}project_team_broker_name\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}project_team_builder_name\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}project_team_architect_name\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}project_team_interior_designer_name\` text;`)) } catch {}

    // About Section
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_about_title\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_about_intro\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_about_background_image_id\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_history_text\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_lifestyle_text\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}about_section_neighborhood_text\` text;`)) } catch {}

    // Elegance Banner
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}elegance_banner_title\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}elegance_banner_description\` text;`)) } catch {}
  }

  // Create neighborhood_accordion array table
  try {
    await db.run(sql.raw(`
      CREATE TABLE IF NOT EXISTS \`properties_neighborhood_accordion\` (
        \`id\` text PRIMARY KEY NOT NULL,
        \`title\` text NOT NULL,
        \`distance\` text,
        \`image_id\` text,
        \`_order\` integer NOT NULL,
        \`_parent_id\` text NOT NULL,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`properties\`(\`id\`) ON DELETE CASCADE
      );
    `))
  } catch {}

  // Create version neighborhood_accordion array table
  try {
    await db.run(sql.raw(`
      CREATE TABLE IF NOT EXISTS \`_properties_v_version_neighborhood_accordion\` (
        \`id\` text PRIMARY KEY NOT NULL,
        \`title\` text NOT NULL,
        \`distance\` text,
        \`image_id\` text,
        \`_order\` integer NOT NULL,
        \`_parent_id\` text NOT NULL,
        FOREIGN KEY (\`_parent_id\`) REFERENCES \`_properties_v\`(\`id\`) ON DELETE CASCADE
      );
    `))
  } catch {}
}

export async function down({ db }: MigrateDownArgs): Promise<void> {
  try { await db.run(sql.raw(`DROP TABLE IF EXISTS \`properties_neighborhood_accordion\`;`)) } catch {}
  try { await db.run(sql.raw(`DROP TABLE IF EXISTS \`_properties_v_version_neighborhood_accordion\`;`)) } catch {}
}

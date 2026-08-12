import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-sqlite'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  // Clean up stale table from a previously failed migration attempt
  await db.run(sql`DROP TABLE IF EXISTS \`__new_properties\`;`)

  // Add the missing columns that versioning/drafts requires
  await db.run(sql`ALTER TABLE \`properties\` ADD \`published_at\` text;`)
  await db.run(sql`ALTER TABLE \`properties\` ADD \`_status\` text DEFAULT 'draft';`)
  await db.run(sql`CREATE INDEX IF NOT EXISTS \`properties__status_idx\` ON \`properties\` (\`_status\`);`)

  // _properties_v, _properties_v_rels, _properties_v_version_floor_plans
  // already exist (created by dev mode push), so skip those CREATE TABLE statements.
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  // No-op: SQLite does not support DROP COLUMN; handle via dev mode if needed
}

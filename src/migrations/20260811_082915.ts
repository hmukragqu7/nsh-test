import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-sqlite'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.run(sql`ALTER TABLE \`properties\` ADD \`meta_title\` text;`)
  await db.run(sql`ALTER TABLE \`properties\` ADD \`meta_description\` text;`)
  await db.run(sql`ALTER TABLE \`properties\` ADD \`meta_image_id\` integer REFERENCES \`media\`(\`id\`) ON UPDATE no action ON DELETE set null;`)
  await db.run(sql`CREATE INDEX IF NOT EXISTS \`properties_meta_meta_image_idx\` ON \`properties\` (\`meta_image_id\`);`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  // SQLite does not support DROP COLUMN in older versions — handled by dev mode push if needed
}

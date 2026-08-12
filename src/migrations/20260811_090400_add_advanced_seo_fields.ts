import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-sqlite'

/**
 * Adds advanced SEO fields to pages, posts, properties (and their version tables).
 * Inside the `meta` group, `metaRobots` is also a group, producing column name `meta_meta_robots_*`.
 */
export async function up({ db }: MigrateUpArgs): Promise<void> {
  const tables = ['pages', 'posts', 'blogs', 'properties', '_pages_v', '_posts_v', '_blogs_v', '_properties_v']

  for (const table of tables) {
    const prefix = table.startsWith('_') ? 'version_' : ''

    // Add meta_focus_keyword & meta_canonical_url
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_focus_keyword\` text;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_canonical_url\` text;`)) } catch {}

    // Add meta_meta_robots_* columns (for group 'meta' -> group 'metaRobots')
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_meta_robots_indexing\` text DEFAULT 'index';`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_meta_robots_following\` text DEFAULT 'follow';`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_meta_robots_noarchive\` integer DEFAULT false;`)) } catch {}
    try { await db.run(sql.raw(`ALTER TABLE \`${table}\` ADD \`${prefix}meta_meta_robots_nosnippet\` integer DEFAULT false;`)) } catch {}
  }
}

export async function down({ db }: MigrateDownArgs): Promise<void> {
}

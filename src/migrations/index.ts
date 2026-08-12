import * as migration_20260811_082915 from './20260811_082915';
import * as migration_20260811_083552 from './20260811_083552';
import * as migration_20260811_090400 from './20260811_090400_add_advanced_seo_fields';
import * as migration_20260812_100000 from './20260812_100000_add_community_content_tables';

export const migrations = [
  {
    up: migration_20260811_082915.up,
    down: migration_20260811_082915.down,
    name: '20260811_082915',
  },
  {
    up: migration_20260811_083552.up,
    down: migration_20260811_083552.down,
    name: '20260811_083552',
  },
  {
    up: migration_20260811_090400.up,
    down: migration_20260811_090400.down,
    name: '20260811_090400_add_advanced_seo_fields',
  },
  {
    up: migration_20260812_100000.up,
    down: migration_20260812_100000.down,
    name: '20260812_100000_add_community_content_tables',
  },
];

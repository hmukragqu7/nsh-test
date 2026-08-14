import { postgresAdapter } from '@payloadcms/db-postgres'
import { sqliteAdapter } from '@payloadcms/db-sqlite'
import { nodemailerAdapter } from '@payloadcms/email-nodemailer'
import sharp from 'sharp'
import path from 'path'
import { buildConfig, PayloadRequest } from 'payload'
import { fileURLToPath } from 'url'

import { Categories } from './collections/Categories'
import { Media } from './collections/Media'
import { Pages } from './collections/Pages'
import { Properties } from './collections/Properties'
import { Blogs } from './collections/Blogs'
import { Posts } from './collections/Posts'
import { Users } from './collections/Users'
import { CF7Tracker } from './collections/CF7Tracker'
import { Footer } from './Footer/config'
import { Header } from './Header/config'
import { Settings } from './globals/Settings'
import { plugins } from './plugins'
import { defaultLexical } from '@/fields/defaultLexical'
import { getServerSideURL } from './utilities/getURL'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

const postgresUrl = process.env.DATABASE_URI || process.env.POSTGRES_URL
const isPostgres = Boolean(
  postgresUrl || (process.env.DATABASE_URL && process.env.DATABASE_URL.startsWith('postgres'))
)

const db = isPostgres
  ? postgresAdapter({
      pool: {
        connectionString: postgresUrl || process.env.DATABASE_URL || '',
      },
      push: process.env.PAYLOAD_DB_PUSH ? process.env.PAYLOAD_DB_PUSH === 'true' : process.env.NODE_ENV !== 'production',
    })
  : sqliteAdapter({
      client: {
        url: process.env.DATABASE_URL || 'file:./my-payload-app.db',
      },
      push: process.env.PAYLOAD_DB_PUSH ? process.env.PAYLOAD_DB_PUSH === 'true' : process.env.NODE_ENV !== 'production',
    })

export default buildConfig({
  admin: {
    components: {
      beforeLogin: ['@/components/BeforeLogin'],
      beforeDashboard: ['@/components/BeforeDashboard'],
    },
    importMap: {
      baseDir: path.resolve(dirname),
    },
    user: Users.slug,
    livePreview: {
      breakpoints: [
        {
          label: 'Mobile',
          name: 'mobile',
          width: 375,
          height: 667,
        },
        {
          label: 'Tablet',
          name: 'tablet',
          width: 768,
          height: 1024,
        },
        {
          label: 'Desktop',
          name: 'desktop',
          width: 1440,
          height: 900,
        },
      ],
    },
  },
  editor: defaultLexical,
  db,
  email: nodemailerAdapter({
    defaultFromAddress: process.env.SMTP_FROM || 'info@novelsignaturehomes.com',
    defaultFromName: process.env.SMTP_FROM_NAME || 'Novel Signature Homes',
    transportOptions: {
      host: process.env.SMTP_HOST || 'sandbox.smtp.mailtrap.io',
      port: Number(process.env.SMTP_PORT || 2525),
      auth: {
        user: process.env.SMTP_USER || '',
        pass: process.env.SMTP_PASS || '',
      },
    },
  }),
  collections: [Pages, Properties, Blogs, Posts, Media, Categories, Users, CF7Tracker],
  cors: [getServerSideURL(), '*'].filter(Boolean),
  globals: [Header, Footer, Settings],
  plugins,
  secret: process.env.PAYLOAD_SECRET || 'a-very-secret-key-that-is-overridden-in-production',
  sharp,
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  jobs: {
    access: {
      run: ({ req }: { req: PayloadRequest }): boolean => {
        if (req.user) return true

        const secret = process.env.CRON_SECRET
        if (!secret) return false

        const authHeader = req.headers.get('authorization')
        return authHeader === `Bearer ${secret}`
      },
    },
    tasks: [],
  },
})

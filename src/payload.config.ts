import { postgresAdapter } from '@payloadcms/db-postgres'
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

const defaultPostgresUrl =
  'postgresql://nsh_db_user:YdLF8z23wEKxOz6iREludj6i0zCWR1zI@dpg-da1uqmrutv3s73b57qag-a.oregon-postgres.render.com/nsh_db?uselibpqcompat=true&sslmode=require'

const postgresUrl = process.env.DATABASE_URI || process.env.POSTGRES_URL || process.env.DATABASE_URL || defaultPostgresUrl

const db = postgresAdapter({
  pool: {
    connectionString: postgresUrl,
  },
  push: process.env.PAYLOAD_DB_PUSH ? process.env.PAYLOAD_DB_PUSH === 'true' : process.env.NODE_ENV !== 'production',
})

const smtpUser = process.env.SMTP_USER
const smtpPass = process.env.SMTP_PASS

const transportOptions: any = {
  host: process.env.SMTP_HOST || 'sandbox.smtp.mailtrap.io',
  port: Number(process.env.SMTP_PORT || 2525),
}

if (smtpUser && smtpPass) {
  transportOptions.auth = {
    user: smtpUser,
    pass: smtpPass,
  }
}

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
    transportOptions,
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

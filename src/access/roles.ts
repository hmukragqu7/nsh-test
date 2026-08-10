import type { Access, FieldAccess } from 'payload'
import type { User } from '@/payload-types'

/**
 * Scalable Role Definitions
 * Easy to extend in the future with additional roles like 'marketing', 'translator', 'reviewer', 'publisher'.
 */
export type UserRole = 'admin' | 'editor' | 'seo-editor'

/**
 * Utility helper to check if a user possesses any of the given roles.
 * Supports both single role string and multiple roles array on user.roles.
 */
export const checkRole = (allottedRoles: UserRole[] = [], user?: User | null): boolean => {
  if (!user || !user.roles) return false
  const userRoles = Array.isArray(user.roles) ? user.roles : [user.roles]
  return allottedRoles.some((role) => userRoles.includes(role as UserRole))
}

/* ==========================================================================
   Collection-Level Access Control Callbacks
   ========================================================================== */

/**
 * Access rule allowing only Admin users.
 */
export const isAdmin: Access = ({ req: { user } }) => {
  return checkRole(['admin'], user as User)
}

/**
 * Access rule allowing only Content Editors.
 */
export const isEditor: Access = ({ req: { user } }) => {
  return checkRole(['editor'], user as User)
}

/**
 * Access rule allowing only SEO Editors.
 */
export const isSeoEditor: Access = ({ req: { user } }) => {
  return checkRole(['seo-editor'], user as User)
}

/**
 * Access rule allowing Admins or SEO Editors.
 */
export const isAdminOrSeo: Access = ({ req: { user } }) => {
  return checkRole(['admin', 'seo-editor'], user as User)
}

/**
 * Access rule allowing Admins or Content Editors.
 */
export const isAdminOrEditor: Access = ({ req: { user } }) => {
  return checkRole(['admin', 'editor'], user as User)
}

/**
 * Access rule for logging into the Payload Admin Panel.
 * Allows any authenticated user assigned a valid role (Admin, Content Editor, or SEO Editor).
 */
export const canAccessAdminPanel = ({ req }: { req: any }): boolean => {
  const user = req.user
  return Boolean(user && user.roles && (user.roles as string[]).length > 0)
}

/* ==========================================================================
   Field-Level Access Control Callbacks
   ========================================================================== */

/**
 * Field-level access: Only Admins can modify the field.
 */
export const isAdminField: FieldAccess = ({ req: { user } }) => {
  return checkRole(['admin'], user as User)
}

/**
 * Field-level access: Admins & Content Editors can modify content fields.
 * SEO Editors will be denied access to content fields.
 */
export const isAdminOrEditorField: FieldAccess = ({ req: { user } }) => {
  return checkRole(['admin', 'editor'], user as User)
}

/**
 * Field-level access: Admins & SEO Editors can modify SEO fields.
 * Content Editors will be denied access to SEO fields.
 */
export const isAdminOrSeoField: FieldAccess = ({ req: { user } }) => {
  return checkRole(['admin', 'seo-editor'], user as User)
}

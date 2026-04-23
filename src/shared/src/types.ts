export interface LinkRecord {
  PK: string
  SK: string
  shortCode: string
  destinationUrl: string
  tenantId: string
  createdAt: string
  expiresAt?: string
  active: boolean
  GSI1PK: string
  GSI1SK: string
}

export interface TenantRecord {
  PK: string
  SK: string
  tenantId: string
  name: string
  apiKeyHash: string
  createdAt: string
  linkCount: number
}

export interface ClickEvent {
  shortCode: string
  timestamp: string
  country?: string
  device?: string
  browser?: string
  referrer?: string
  ip?: string
}

export interface DailyStats {
  PK: string
  SK: string
  totalClicks: number
  byCountry: Record<string, number>
  byDevice: Record<string, number>
}

export interface ApiResponse<T = unknown> {
  statusCode: number
  body: string
  headers?: Record<string, string>
}

export interface AuthenticatedContext {
  tenantId: string
  tenantName: string
}

export const PREFIXES = {
  LINK: 'LINK#',
  TENANT: 'TENANT#',
  CLICK: 'CLICK#',
  STATS_DAY: 'STATS#DAY#',
  STATS_MONTH: 'STATS#MONTH#',
  META: 'META',
} as const

export function linkPK(shortCode: string): string {
  return `${PREFIXES.LINK}${shortCode}`
}

export function tenantPK(tenantId: string): string {
  return `${PREFIXES.TENANT}${tenantId}`
}

export function clickSK(timestamp: string, uuid: string): string {
  return `${PREFIXES.CLICK}${timestamp}#${uuid}`
}

export function statsDaySK(date: string): string {
  return `${PREFIXES.STATS_DAY}${date}`
}

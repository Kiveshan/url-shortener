# DynamoDB single-table schema

Table name: `url-shortener-{environment}`
Billing mode: PROVISIONED (25 WCU / 25 RCU — always-free tier)

## Primary key
| Key | Type | Description |
|-----|------|-------------|
| PK  | String | Partition key — entity type prefix + ID |
| SK  | String | Sort key — sub-entity type prefix + ID |

## GSI1
| Key    | Type   | Description |
|--------|--------|-------------|
| GSI1PK | String | GSI partition key |
| GSI1SK | String | GSI sort key |

## Access patterns

### 1. Redirect lookup (hot path)
- **Operation**: GetItem
- **PK**: `LINK#{shortCode}`
- **SK**: `META`
- **Returns**: destinationUrl, tenantId, active, expiresAt

### 2. List all links for a tenant
- **Operation**: Query on GSI1
- **GSI1PK**: `TENANT#{tenantId}`
- **GSI1SK begins_with**: `LINK#`
- **Returns**: all link records for tenant

### 3. Raw click event (write)
- **Operation**: PutItem
- **PK**: `LINK#{shortCode}`
- **SK**: `CLICK#{ISO8601_timestamp}#{uuid}`
- **TTL**: now + 90 days (auto-deleted)
- **Attributes**: country, device, browser, referrer

### 4. Daily click aggregate
- **Operation**: UpdateItem (atomic increment)
- **PK**: `LINK#{shortCode}`
- **SK**: `STATS#DAY#{YYYY-MM-DD}`
- **Expression**: ADD totalClicks :one

### 5. Monthly tenant summary
- **Operation**: UpdateItem (atomic increment)
- **PK**: `TENANT#{tenantId}`
- **SK**: `STATS#MONTH#{YYYY-MM}`
- **Expression**: ADD totalClicks :one

## TTL
Raw click events (SK begins with `CLICK#`) carry a TTL attribute
set to 90 days from creation. DynamoDB deletes them automatically.
No cleanup job required.

import { DynamoDBClient } from '@aws-sdk/client-dynamodb'
import { DynamoDBDocumentClient } from '@aws-sdk/lib-dynamodb'

let client: DynamoDBDocumentClient | null = null

export function getDynamoDBClient(): DynamoDBDocumentClient {
  if (client) return client

  const ddbClient = new DynamoDBClient({
    region: process.env.AWS_REGION ?? 'us-east-1',
  })

  client = DynamoDBDocumentClient.from(ddbClient, {
    marshallOptions: {
      removeUndefinedValues: true,
      convertEmptyValues: false,
    },
  })

  return client
}

export function getTableName(): string {
  const tableName = process.env.TABLE_NAME
  if (!tableName) {
    throw new Error('TABLE_NAME environment variable is not set')
  }
  return tableName
}

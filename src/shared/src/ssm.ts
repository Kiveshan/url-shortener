import { SSMClient, GetParameterCommand } from '@aws-sdk/client-ssm'

const ssmClient = new SSMClient({
  region: process.env.AWS_REGION ?? 'us-east-1',
})

const cache: Record<string, string> = {}

export async function getParameter(name: string): Promise<string> {
  if (cache[name]) return cache[name]

  const command = new GetParameterCommand({
    Name: name,
    WithDecryption: true,
  })

  const response = await ssmClient.send(command)
  const value = response.Parameter?.Value

  if (!value) {
    throw new Error(`SSM parameter not found: ${name}`)
  }

  cache[name] = value
  return value
}

export function buildParamName(key: string): string {
  const project = process.env.PROJECT_NAME ?? 'url-shortener'
  const env = process.env.ENVIRONMENT ?? 'dev'
  return `/${project}/${env}/${key}`
}

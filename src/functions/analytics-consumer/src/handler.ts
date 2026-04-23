export async function handler(event: unknown): Promise<unknown> {
  console.log('Event:', JSON.stringify(event, null, 2))
  return { statusCode: 200, body: 'placeholder' }
}

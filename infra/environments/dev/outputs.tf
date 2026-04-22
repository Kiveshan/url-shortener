output "dynamodb_table_name" {
  description = "Main DynamoDB table name"
  value       = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  description = "Main DynamoDB table ARN"
  value       = module.dynamodb.table_arn
}

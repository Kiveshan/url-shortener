output "dynamodb_table_name" {
  description = "Main DynamoDB table name"
  value       = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  description = "Main DynamoDB table ARN"
  value       = module.dynamodb.table_arn
}

output "redirect_role_arn" {
  value = module.lambda_roles.redirect_role_arn
}

output "shorten_role_arn" {
  value = module.lambda_roles.shorten_role_arn
}

output "analytics_consumer_role_arn" {
  value = module.lambda_roles.analytics_consumer_role_arn
}

output "management_api_role_arn" {
  value = module.lambda_roles.management_api_role_arn
}

output "analytics_queue_url" {
  value = module.sqs.analytics_queue_url
}

output "analytics_queue_arn" {
  value = module.sqs.analytics_queue_arn
}

output "table_name" {
  description = "DynamoDB table name"
  value       = aws_dynamodb_table.main.name
}

output "table_arn" {
  description = "DynamoDB table ARN"
  value       = aws_dynamodb_table.main.arn
}

output "table_stream_arn" {
  description = "DynamoDB stream ARN (for future use)"
  value       = aws_dynamodb_table.main.stream_arn
}

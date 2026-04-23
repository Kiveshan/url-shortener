output "redirect_role_arn" {
  description = "IAM role ARN for the redirect Lambda"
  value       = aws_iam_role.redirect.arn
}

output "shorten_role_arn" {
  description = "IAM role ARN for the shorten Lambda"
  value       = aws_iam_role.shorten.arn
}

output "analytics_consumer_role_arn" {
  description = "IAM role ARN for the analytics consumer Lambda"
  value       = aws_iam_role.analytics_consumer.arn
}

output "management_api_role_arn" {
  description = "IAM role ARN for the management API Lambda"
  value       = aws_iam_role.management_api.arn
}

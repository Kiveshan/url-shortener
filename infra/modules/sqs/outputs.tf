output "analytics_queue_arn" {
  description = "ARN of the analytics SQS queue"
  value       = aws_sqs_queue.analytics.arn
}

output "analytics_queue_url" {
  description = "URL of the analytics SQS queue"
  value       = aws_sqs_queue.analytics.url
}

output "analytics_dlq_arn" {
  description = "ARN of the analytics dead-letter queue"
  value       = aws_sqs_queue.analytics_dlq.arn
}

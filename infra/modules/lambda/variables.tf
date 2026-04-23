variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the main DynamoDB table"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN of the analytics SQS queue"
  type        = string
  default     = ""
}

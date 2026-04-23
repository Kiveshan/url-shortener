variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "message_retention_seconds" {
  description = "How long SQS retains unprocessed messages"
  type        = number
  default     = 86400
}

variable "visibility_timeout_seconds" {
  description = "How long a message is hidden after being received"
  type        = number
  default     = 30
}

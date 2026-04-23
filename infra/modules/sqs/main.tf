locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_sqs_queue" "analytics_dlq" {
  name                      = "${local.name_prefix}-analytics-dlq"
  message_retention_seconds = 1209600

  tags = {
    Name    = "${local.name_prefix}-analytics-dlq"
    Purpose = "dead-letter-queue"
  }
}

resource "aws_sqs_queue" "analytics" {
  name                       = "${local.name_prefix}-analytics"
  message_retention_seconds  = var.message_retention_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.analytics_dlq.arn
    maxReceiveCount     = 3
  })

  tags = {
    Name    = "${local.name_prefix}-analytics"
    Purpose = "click-event-pipeline"
  }
}

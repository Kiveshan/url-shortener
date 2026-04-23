terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "url-shortener"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

module "dynamodb" {
  source = "../../modules/dynamodb"

  project_name   = var.project_name
  environment    = var.environment
  read_capacity  = 25
  write_capacity = 25
}

module "sqs" {
  source = "../../modules/sqs"

  project_name = var.project_name
  environment  = var.environment
}

module "lambda_roles" {
  source = "../../modules/lambda"

  project_name       = var.project_name
  environment        = var.environment
  dynamodb_table_arn = module.dynamodb.table_arn
  sqs_queue_arn      = module.sqs.analytics_queue_arn
}

resource "aws_ssm_parameter" "analytics_queue_url" {
  name  = "/${var.project_name}/${var.environment}/analytics-queue-url"
  type  = "String"
  value = module.sqs.analytics_queue_url

  tags = {
    Name = "analytics-queue-url"
  }
}

resource "aws_ssm_parameter" "table_name" {
  name  = "/${var.project_name}/${var.environment}/dynamodb-table-name"
  type  = "String"
  value = module.dynamodb.table_name

  tags = {
    Name = "dynamodb-table-name"
  }
}

resource "aws_ssm_parameter" "environment" {
  name  = "/${var.project_name}/${var.environment}/environment"
  type  = "String"
  value = var.environment

  tags = {
    Name = "environment"
  }
}

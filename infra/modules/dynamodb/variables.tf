variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "read_capacity" {
  description = "Provisioned read capacity units"
  type        = number
  default     = 25
}

variable "write_capacity" {
  description = "Provisioned write capacity units"
  type        = number
  default     = 25
}

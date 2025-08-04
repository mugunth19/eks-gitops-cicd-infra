variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "admin_user_arn" {
  description = "ARN of the IAM user to be added as a cluster admin"
  type        = string
}

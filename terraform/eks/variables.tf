
variable "vpc_id" {
  description = "VPC ID to launch EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS worker nodes"
  type        = list(string)
}

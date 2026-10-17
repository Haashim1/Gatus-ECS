variable "name_prefix" {
  type        = string
  description = "Prefix for naming resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the security groups"
}

variable "container_port" {
  type        = number
  description = "Port for the container"
}


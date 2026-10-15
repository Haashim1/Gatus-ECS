variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the ALB will be deployed"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for the ALB"
}

variable "alb_sg_id" {
  type        = string
  description = "The ID of the security group for the ALB"
}

variable "certificate_arn" {
  type        = string
  description = "The ARN of the ACM certificate for the ALB"
}

variable "container_port" {
  type        = number
  description = "The port on which the container is listening"
}

variable "health_check_path" {
  type        = string
  description = "The path for the ALB health check"
}
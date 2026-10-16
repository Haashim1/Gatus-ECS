variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "region" {
  type        = string
  description = "AWS region for ECS resources"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for ECS resources"
}

variable "ecs_sg_id" {
  type        = string
  description = "ID of the security group for the ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group for ECS service"
}

variable "container_image" {
  type        = string
  description = "Container image for ECS service"
}

variable "container_port" {
  type        = number
  description = "Port on which the container listens"
}

variable "cpu" {
  type        = number
  description = "CPU units for the ECS task"
}

variable "memory" {
  type        = number
  description = "Memory in MiB for the ECS task"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS tasks"
}

variable "log_retention_in_days" {
  type        = number
  description = "Number of days to retain logs in CloudWatch"
}

variable "db_host" {
  type        = string
  description = "Database host for ECS service"
}

variable "db_name" {
  type        = string
  description = "Database name for ECS service"
}

variable "db_username" {
  type        = string
  description = "Database username for ECS service"
}

variable "db_secret_arn" {
  type        = string
  description = "ARN of the secret containing the database password"
}
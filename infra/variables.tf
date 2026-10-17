variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "eu-west-2"
}

variable "project_name" {
  type        = string
  description = "project name for resources"
  default     = "gatus"
}

variable "environment" {
  type        = string
  description = "Environment for resources"
  default     = "dev"
}

variable "domain_name" {
  type        = string
  description = "Domain name for resources"
  default     = "haashimdevops.co.uk"
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain name for resources"
  default     = "tm"
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name for resources"
  default     = "gatus"
}

variable "image_tag" {
  type        = string
  description = "Docker image tag for resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "container_port" {
  type        = number
  description = "Port for the container"
}

variable "health_check_path" {
  type        = string
  description = "Path for the ALB health check"
}

variable "cpu" {
  type        = number
  description = "The number of CPU units for the ECS task"
}

variable "memory" {
  type        = number
  description = "The amount of memory (in MiB) for the ECS task"
}

variable "log_retention_in_days" {
  type        = number
  description = "The number of days to retain logs in CloudWatch"
}

variable "desired_count" {
  type        = number
  description = "The desired number of ECS tasks"
}
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
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones for the VPC"
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for database subnets"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
} 
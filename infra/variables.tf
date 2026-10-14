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


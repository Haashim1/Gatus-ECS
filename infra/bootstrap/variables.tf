variable "region" {
  type        = string
  description = "AWS region for bootstrapping resources"
  default     = "eu-west-2"
}

variable "project_name" {
  type        = string
  description = "project name for bootstrapping resources"
  default     = "gatus"
}

variable "environment" {
  type        = string
  description = "Environment for bootstrapping resources"
  default     = "lab"
}
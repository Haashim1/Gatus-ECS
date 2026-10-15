variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "database_subnet_ids" {
  type        = list(string)
  description = "List of database subnet IDs for the RDS instance"
}

variable "rds_sg_id" {
  type        = string
  description = "The ID of the security group for the RDS instance"
}

variable "db_name" {
  type        = string
  description = "The name of the database for the RDS instance"
}

variable "db_username" {
  type        = string
  description = "The username for the RDS instance"
}

variable "instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
}

variable "engine_version" {
  type        = string
  description = "The engine version for the RDS instance"
}

variable "multi_az" {
  type        = bool
  description = "Whether to create a Multi-AZ RDS instance"
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gigabytes for the RDS instance"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the ACM certificate"
}

variable "zone_id" {
  type        = string
  description = "The Route 53 hosted zone ID for the domain"
}
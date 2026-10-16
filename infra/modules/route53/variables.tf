variable "zone_id" {
  type        = string
  description = "The ID of the Route 53 hosted zone"
}

variable "fqdn" {
  type        = string
  description = "The fully qualified domain name for the Route 53 record"
}

variable "alb_dns_name" {
  type        = string
  description = "The DNS name of the ALB for the Route 53 record"
}

variable "alb_zone_id" {
  type        = string
  description = "The hosted zone ID of the ALB for the Route 53 record"
}
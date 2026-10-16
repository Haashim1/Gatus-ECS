locals {
  name_prefix = "${var.project_name}-${var.environment}"
  fqdn        = "${var.subdomain_name}.${var.domain_name}"
}
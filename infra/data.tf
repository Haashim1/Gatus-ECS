data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

data "aws_ecr_repository" "service" {
  name = var.ecr_repository_name
}

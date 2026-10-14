output "hosted_zone_id" {
  value       = data.aws_route53_zone.selected.zone_id
  description = "The ID of the selected Route 53 hosted zone"
}

output "ecr_repository_uri" {
  value       = data.aws_ecr_repository.service.repository_url
  description = "The URI of the selected ECR repository"
}
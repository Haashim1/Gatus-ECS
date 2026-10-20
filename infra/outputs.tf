output "hosted_zone_id" {
  value       = data.aws_route53_zone.selected.zone_id
  description = "The ID of the selected Route 53 hosted zone"
}

output "ecr_repository_uri" {
  value       = data.aws_ecr_repository.service.repository_url
  description = "The URI of the selected ECR repository"
}

output "ecs_cluster_name" {
    value       = module.ecs.cluster_name
  description = "The name of the ECS cluster"
}

output "ecs_service_name" {
    value       = module.ecs.service_name
  description = "The name of the ECS service"
}

output "app_url" {
  value       = "https://${var.subdomain_name}.${var.domain_name}"
  description = "The URL of the application"
}
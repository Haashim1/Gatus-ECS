output "cluster_name" {
  value       = aws_ecs_cluster.ecs_cluster.name
  description = "The name of the ECS cluster"
}
output "service_name" {
  value       = aws_ecs_service.this.name
  description = "The name of the ECS service"
}
output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "The ID of the ALB security group"
}

output "ecs_sg_id" {
  value       = aws_security_group.ecs.id
  description = "The ID of the ECS security group"
}



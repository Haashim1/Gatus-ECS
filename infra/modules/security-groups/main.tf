resource "aws_security_group" "alb" {
  #checkov:skip=CKV2_AWS_5:False positive; attached to the ALB/ECS service via module outputs, which this check cannot follow
  name        = "${var.name_prefix}-alb-sg"
  description = "Security group for the ALB that allows HTTP and HTTPS traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  #checkov:skip=CKV_AWS_260:Port 80 is required so the ALB can redirect HTTP to HTTPS; no content is served on it
  description       = "HTTP from internet, redirected to HTTPS"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  description       = "HTTPS from internet"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_egress" {
  description       = "Allow all outbound traffic from the ALB"
  ip_protocol       = "-1"
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_security_group" "ecs" {
  #checkov:skip=CKV2_AWS_5:False positive; attached to the ALB/ECS service via module outputs, which this check cannot follow
  name        = "${var.name_prefix}-ecs-sg"
  description = "Security group for the ECS tasks that allows traffic from the ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-ecs-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
  description                  = "App port from the ALB only"
  from_port                    = var.container_port
  to_port                      = var.container_port
  ip_protocol                  = "tcp"
  security_group_id            = aws_security_group.ecs.id
  referenced_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_egress_rule" "ecs_egress" {
  description       = "Allow all outbound traffic from the ECS tasks"
  ip_protocol       = "-1"
  security_group_id = aws_security_group.ecs.id
  cidr_ipv4         = "0.0.0.0/0"
}
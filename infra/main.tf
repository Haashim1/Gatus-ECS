module "vpc" {
  source               = "./modules/vpc"
  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
}

module "security_groups" {
  source         = "./modules/security-groups"
  name_prefix    = local.name_prefix
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
}

module "acm" {
  source      = "./modules/acm"
  domain_name = local.fqdn
  zone_id     = data.aws_route53_zone.selected.zone_id
}

module "alb" {
  source            = "./modules/alb"
  name_prefix       = local.name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port    = var.container_port
  alb_sg_id         = module.security_groups.alb_sg_id
  certificate_arn   = module.acm.certificate_arn
  health_check_path = var.health_check_path
}


module "ecs" {
  source                = "./modules/ecs"
  name_prefix           = local.name_prefix
  container_image       = "${data.aws_ecr_repository.service.repository_url}:${var.image_tag}"
  container_port        = var.container_port
  desired_count         = var.desired_count
  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_sg_id             = module.security_groups.ecs_sg_id
  target_group_arn      = module.alb.target_group_arn
  region                = var.region
  cpu                   = var.cpu
  memory                = var.memory
  log_retention_in_days = var.log_retention_in_days
  depends_on            = [module.alb]

}

module "route53" {
  source       = "./modules/route53"
  zone_id      = data.aws_route53_zone.selected.zone_id
  fqdn         = local.fqdn
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}




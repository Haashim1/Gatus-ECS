module "vpc" {
  source                = "./modules/vpc"
  name_prefix           = local.name_prefix
  vpc_cidr              = var.vpc_cidr
  azs                   = var.azs
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  region                = var.region
}

module "security_groups" {
  source         = "./modules/security-groups"
  name_prefix    = local.name_prefix
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
  db_port        = var.db_port
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
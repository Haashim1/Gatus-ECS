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
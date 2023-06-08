module "middleware" {
  source = "./aws/middleware"

  name            = var.name
  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "headsccale-server" {
  source = "./aws/headscale-server"

  instance_ami     = var.instance_ami
  key_name         = var.key_name
  server_name      = var.server_name
  environment      = var.environment
  instance_type    = var.instance_type
  public_subnet_id = module.middleware.public_subnet_ids[0]
  vpc_id           = module.middleware.vpc_id
}

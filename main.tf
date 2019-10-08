module "app" {
  source = "./modules/app"

  name        = var.name
  instance_type = var.instance_type
  num_apps = var.num_apps
  vpc_id = module.vpc.vpc_id
  app_subnet_id = module.vpc.app_subnet_id
}

// module "vpc" {
//   source = "./modules/vpc"
//   cidr_block = var.cidr_block
// }

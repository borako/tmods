module "app" {
  source = "./modules/app"

  name        = var.name

  subnet_id = module.vpc.app_subnet_id
  // security_groups = var.security_groups
  // internal        = var.internal
  //
  // cross_zone_load_balancing   = var.cross_zone_load_balancing
  // idle_timeout                = var.idle_timeout
  // connection_draining         = var.connection_draining
  // connection_draining_timeout = var.connection_draining_timeout
  //
  // listener     = var.listener
  // access_logs  = var.access_logs
  // health_check = var.health_check
  //
  // tags = merge(
  //   var.tags,
  //   {
  //     "Name" = format("%s", var.name)
  //   },
  // )
}

module "vpc" {
  source = "./modules/vpc"


}

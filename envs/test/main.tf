
module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block # Shared
  availability_zone = var.availzone
  vpc_name = var.vpc_name
  pubip = var.subnet_public_ip_assign
  mgmt_subnet_name = var.mgmt_name
  mgmt_cidr_block = var.mgmt_cidr_block
  sds_subnet_name = var.sds_name
  sds_cidr_block = var.sds_cidr_block
}
module "mgmt" {
  source = "../../modules/mgmt"
  vpcid = module.vpc.vpc_id
  bastion_ami_id = var.default_ami_id
  availability_zone = var.availzone
  bastion_instances_countnum = var.bastion_instances_count
  bastion_instance_type = var.bastion_instance_type
  key_name = var.default_key_name
  mgmt_subnet_id = module.vpc.mgmt_subnet_id
}
module "sdsapp" {
  source = "../../modules/sdsapp"
  vpcid = module.vpc.vpc_id
  ami_id = var.default_ami_id
  availability_zone = var.availzone
  instances_countnum = var.sds_instances_count
  instance_type = var.sds_instance_type
  key_name = var.default_key_name
  sds_subnet_id = module.vpc.sds_subnet_id
  mgmt_sg_id = module.mgmt.mgmt_sg_id
}

provider "aws" {
  region  = "us-east-1"
}
#
# variable "ami_id" {
#   description = "AMI ID to be used - common"
#   type = string
#   default = "ami-098f16afa9edf40be"
# }
# variable "vpc_cidr_block" {
#   description = "CIDR block for the vpc"
#   type = string
#   default = "172.16.0.0/16"
# }
# variable "vpc_name" {
#   description = "Name for the VPC"
#   type = string
#   default = "testmain"
# }
# variable "sds_instance_type" {
#   description = "Instance Type for SDS app instance"
#   type = string
#   default = "t2.micro"
# }
# variable "sds_instances_count" {
#   description = "Instances count for SDS"
#   type = number
#   default = 2
# }
# variable "sds_cidr_block" {
#   description = "CIDR block for the sds"
#   type = string
#   default = "172.16.11.0/28"
# }
# variable "availability_zone" {
#   description = "Availability zone"
#   type = string
#   default = "us-east-1a"
# }

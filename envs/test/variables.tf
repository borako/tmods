// variable "num_apps" {
//   description = "Number of app instances"
//   type = number
// }
//
// variable "instance_type" {
//   description = "Instance type used"
//   type = string
// }
//
// variable "name" {
//   description = "The name of the cluster"
//   type = string
// }

# variable "cidr_block" {
#   description = "CIDR block for the vpc and subnets"
#   type = map
# }

// variable "vpc_id" {
//   description = "Main VPC ID"
//   type = string
// }
// variable "app_subnet_id" {
//   description = "Subnet ID for app"
//   type = string
// }

variable "default_ami_id" {
  description = "AMI ID to be used - common"
  type = string
  default = "ami-02354e95b39ca8dec"
}
variable "vpc_cidr_block" {
  description = "CIDR block for the vpc"
  type = string
  default = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "Name for the VPC"
  type = string
  default = "testmain"
}
variable "bastion_instances_count" {
  description = "instances count for bastion Server"
  type = number
  default = 1
}
variable "mgmt_cidr_block" {
  description = "CIDR Block for Management subnet"
  type = string
  default = "10.0.1.0/24"
}
variable "mgmt_name" {
  description = "Name for Management"
  type = string
  default = "MGMT"
}
variable "bastion_instance_type" {
  description = "Instance Type for bastion Server"
  type = string
  default = "t2.micro"
}
variable "sds_name" {
  description = "Name for SDS"
  type = string
  default = "SDS"
}
variable "sds_instance_type" {
  description = "Instance Type for SDS app instance"
  type = string
  default = "t2.micro"
}
variable "sds_instances_count" {
  description = "Instances count for SDS"
  type = number
  default = 2
}
variable "sds_cidr_block" {
  description = "CIDR block for the SDS"
  type = string
  default = "10.0.11.0/24"
}
variable "availzone" {
  description = "Availability zone"
  type = string
  default = "us-east-1a"
}
variable "subnet_public_ip_assign" {
  description = "Flag for public IP assignment"
  type = bool
  default = true
}
variable "default_key_name" {
  description = "Default key name to connect to instance"
  type = string
  default = "aws_test_default"
}

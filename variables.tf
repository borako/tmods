variable "num_apps" {
  description = "Number of app instances"
  type = number
}

variable "instance_type" {
  description = "Instance type used"
  type = string
}

variable "name" {
  description = "The name of the cluster"
  type = string
}

variable "cidr_block" {
  description = "CIDR block for the vpc and subnets"
  type = map
}

// variable "vpc_id" {
//   description = "Main VPC ID"
//   type = string
// }
// variable "app_subnet_id" {
//   description = "Subnet ID for app"
//   type = string
// }

variable "num" {
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

// variable "app_subnet_id" {
//   description = "Subnet id for app"
//   type = string
// }
//
variable "vpc_id" {
  description = "VPC id"
  type = string
}

variable "fp_sg_id" {
  description = "SG id for fp"
  type = string
}

variable "cidr_block" {
  description = "CIDR block for app subnet"
  type = string
}

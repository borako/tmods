variable "num" {
  description = "Number of fp instances"
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

variable "vpc_id" {
  description = "VPC id"
  type = string
}

variable "cidr_block" {
  description = "CIDR block for fp subnet"
  type = string
}

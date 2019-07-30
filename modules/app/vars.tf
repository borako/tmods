variable "num_apps" {
  description = "Number of app instances"
  type = number
}

// variable "ami_name" {
//   description = "AMI used for the instance"
//   type = string
// }
variable "instance_type" {
  description = "Instance type used"
  type = string
}
variable "name" {
  description = "The name of the cluster"
  type = string
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

// resource "aws_subnet" "app" {
//   vpc_id = aws_vpc.main.id
//   availability_zone = "us-east-1a"
//   cidr_block = var.cidr_block["app"]
//   tags = {
//     Name = "app"
//   }
// }


// resource "aws_subnet" "s2" {
//   vpc_id = aws_vpc.main.id
//   availability_zone = "us-east-1a"
//   cidr_block = "10.0.2.0/24"
// }

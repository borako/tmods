provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
  required_version = ">= 0.12.0"
}

// module "vpc" {
//   source = "../vpc"
// }

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

variable "server_port" {
  description = "The port the server will use"
  default = 8080
}

resource "aws_instance" "app" {
  // ami = "${data.aws_ami.ubuntu.id}"
  count = var.num_apps
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.app.id]
  subnet_id = var.app_subnet_id

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
  tags = {
    Name = "app-${count.index}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "app" {
  name = "${var.name}-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "asg_allow_inbound" {
  type = "ingress"
  from_port = var.server_port
  to_port = var.server_port
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}
//
// resource "aws_security_group" "elb" {
//   name = "elb-sg"
//
//   ingress {
//     from_port = 8000
//     to_port = 8000
//     protocol = "tcp"
//     cidr_blocks = ["0.0.0.0/0"]
//   }
// }
//
// resource "aws_elb" "main" {
//   name = "Main ELB"
//   security_groups = ["aws_security_group.elb.id"]
//   availability_zones = ["us-east-1a"]
//
//   listener {
//     instance_port   = 8000
//     instance_protocol = "http"
//     lb_port = 8080
//     lb_protocol = "http"
//   }
//
//   instances = ["${aws_instance.app.id}"]
// }
//
// output "pub_ip" {
//   value = "${aws_instance.test1.public_ip}"
// }

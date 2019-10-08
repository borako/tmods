provider "aws" {
  region = "us-east-1"
}

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

resource "aws_instance" "fp" {
  count = var.num
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.fp.id]
  subnet_id = aws_subnet.fp.id

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

# Security group
resource "aws_security_group" "fp" {
  name = "${var.name}-sg"
  vpc_id = var.vpc_id
}

# Ingress rule for SG
resource "aws_security_group_rule" "asg_allow_inbound" {
  type = "ingress"
  from_port = var.server_port
  to_port = var.server_port
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.fp.id
}

# Subnet
resource "aws_subnet" "fp" {
  vpc_id = var.vpc_id
  availability_zone = "us-east-1a"
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}

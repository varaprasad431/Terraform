provider "aws"{
region = "us-east-1"
}

locals {
env = "prasad_digital_vibes"
}

resource "aws_vpc" "prasadfirst" {
cidr_block = "10.6.0.0/16"
tags = {
Name = "${local.env}-vpc"
}
}

resource "aws_subnet" "prasadsecond" {
vpc_id = aws_vpc.prasadfirst.id
cidr_block = "10.6.0.0/16"
tags = {
Name = "${local.env}-subnet"
}
}

resource "aws_instance" "prasadthree" {
ami = var.ami
subnet_id = aws_subnet.prasadsecond.id
instance_type = var.instance_type
key_name = var.key_name
tags = {
Name = "${local.env}-instance"
}
}

variable "ami"{
description = " ami id "
type = string
default = "ami-0fff1b9a61dec8a5f"
}

variable "instance_type"{
description = " instance type details "
type = string
default = "t2.micro"
}

variable "key_name"{
description = " about key name"
type = string
default = "project"
}

output "prasad_requirments" {
value = [aws_instance.prasadthree.instance_state,aws_instance.prasadthree.public_ip,aws_instance.prasadthree.public_dns,aws_instance.prasadthree.private_ip]
}

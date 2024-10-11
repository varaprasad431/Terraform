provider "aws" {
region = "ap-south-1"
}

locals {
env = "prasad_digital_vibes"
}

resource "aws_vpc"  "prasadone" {
cidr_block = "10.6.0.0/16"
tags = {
Name = "${local.env}-vpc"
}
}

resource  "aws_subnet" "prasadtwo" {
cidr_block = "10.6.0.0/16"
vpc_id =  aws_vpc.prasadone.id
tags = {
Name = "${local.env}-subnet"
}
}

resource "tls_private_key" "prasadfour" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "prasadfive" {
  key_name = "prasad_digital_vibes"
  public_key = tls_private_key.prasadfour.public_key_openssh
}

resource "aws_instance" "prasadthree" {
subnet_id = aws_subnet.prasadtwo.id
ami = "ami-0dee22c13ea7a9a67"
instance_type = "t2.micro"
key_name = "prasad_digital_vibes"
tags ={
Name = "${local.env}-terrafrom_instance"
}
}

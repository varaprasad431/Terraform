provider "aws" {
region = "ap-south-1"
}

resource "aws_iam_user" "first" {
for_each = var.user_name
name = each.value
}


resource "aws_ebs_volume" "second" {
size = 18
availability_zone= "ap-south-1a"
tags = {
Name = "prasad_digital_vibes-volume"
}
}

resource "aws_s3_bucket" "three" {
bucket = "prasaddigitalvibes786"
}

variable "user_name" {
description = " this is reference for the vaiable"
type = set(string)
default = ["prasad_digital_vibes01", "prasad02", "prasad03","prasad02"]
}

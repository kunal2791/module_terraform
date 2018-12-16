variable "ami" {
  type = "map"
  default = {
    "ap-southeast-1" = "ami-0b84d2c53ad5250c2"
    "eu-west-1" = "ami-0b5b6c7f"
    "us-west-1" = "ami-3bcc9e7e"
    "us-west-2" = "ami-52ff7262"
    "us-east-1" = "ami-c6699baf"
  }
}

variable "region" {
  description = "AWS region Name"
}

variable "vpc_id" {
  description = "The VPC ID in which you want to create resources"
}

variable "public_subnet_ids" {
  description = "Set all public subnet"
  type = "list"
}

variable "instance_type" {
  description = "Server Instance type"

}

variable "ssh_key" {
  description = "The ssh key which will be used to login"
}

variable "owner" {
  description = "The value of Owner tag"
}

variable "env" {
  description = "The vaule of Envrinonment tag"
}

variable "project" {}

variable "root_volume_size" {
  description = "The vaule of Envrinonment tag"

}


variable "jump_sg_description" {
  description = "Jump server security group"

}

variable "ssh_access_sg_id" {
  description = "The list of security Group IDs to allow ssh access"
  type = "list"
}
variable "ssh_access_cidr" {
  description = "The list of VPN CIDR to allow ssh access"
  type = "list"
}
variable "r53_private_id" {
  description = "Internal domain R53 zone id"

}
variable "is_private_r53" {
  description = "Set this variable to true if you want to create dns entry in internal domain"

}
variable "aws_iam" {}

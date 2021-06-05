variable "vpc_name" {
  type = string
}

variable "region" {
  type = string
}

variable "private_subnet_block_region_a" {
  type = string
}

variable "private_subnet_block_region_b" {
  type = string
}

variable "public_subnet_block_region_a" {
  type = string
}

variable "public_subnet_block_region_b" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "default_cidr_block" {
  type = string
}

variable "ssh_port" {
  type = string
}


variable "ec2_user" {
  type = string
}

variable "instance_type" {
  type = string
}


variable "ami" {
    type = "map"
    
    default = {
        us-east-1 = "ami-0c2a1acae6667e438"
    }
}

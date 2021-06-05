terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "zeta-poc" {
    region                          = "us-east-1"
    source                          = "./tfmodules/zeta-poc"
    vpc_name                        = "simple-vpc"
    cidr_block                      = "10.0.0.0/16"
    default_cidr_block              = "0.0.0.0/0"
    private_subnet_block_region_a   = "10.0.1.0/25"
    private_subnet_block_region_b   = "10.0.2.0/25"
    public_subnet_block_region_a    = "10.0.101.0/25"
    public_subnet_block_region_b    = "10.0.102.0/25"
    ssh_port                        = "22"
    instance_type                   = "t2.micro"
    ec2_user                        = "admin"

}
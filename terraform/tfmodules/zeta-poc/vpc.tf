data "aws_vpc" "simple-vpc" {
  id = aws_vpc.simple-vpc.id
}

resource "aws_vpc" "simple-vpc" {

  cidr_block = "${var.cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true


  tags = {
    Name        = "simple-vpc"
    Owner       = "user"
    Environment = "dev"
  }
}


resource "aws_internet_gateway" "simple-vpc-igw" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    tags = {
        Name = "simple-vpc-igw"
    }
}


resource "aws_route_table" "simple-route-table" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    
    route {
        cidr_block = "${var.cidr_block}" 
        gateway_id = "${aws_internet_gateway.simple-vpc-igw.id}" 
    }
    
    tags = {
        Name = "simple-route-table"
    }
}

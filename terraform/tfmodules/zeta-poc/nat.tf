###### Elastic IP for NAT  ########

resource "aws_eip" "simple-natgw-eip"{
    vpc = true
    depends_on = [aws_internet_gateway.simple-vpc-igw]
}

###### NAT #####

resource "aws_nat_gateway" "simple-natgw"{
    allocation_id = "${aws_eip.simple-natgw-eip.id}"
    subnet_id = "${aws_subnet.simple-vpc-public-subnet-region-a.id}"
    tags = {
        Name = "simple-natgw"
    }
    depends_on = [
      aws_internet_gateway.simple-vpc-igw
    ]

}

######### Routing table for Private subnet ######

resource "aws_route_table" "simple-route-private" {
  vpc_id = "${aws_vpc.simple-vpc.id}"
  tags = {
    Name        = "simple-route-private"
  }
}



resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.simple-route-private.id}"
  destination_cidr_block = "${var.default_cidr_block}"
  nat_gateway_id         = "${aws_nat_gateway.simple-natgw.id}"
}

######### Routing table for Public subnet #####

resource "aws_route_table" "simple-route-table-public" {
  vpc_id = "${aws_vpc.simple-vpc.id}"
  tags = {
    Name        = "simple-route-table-public"
  }
}

resource "aws_route" "simple-public-internet-gateway" {
  route_table_id         = "${aws_route_table.simple-route-table-public.id}"
  destination_cidr_block = "${var.default_cidr_block}"
  gateway_id             = "${aws_internet_gateway.simple-vpc-igw.id}"
}




######## region a ############

resource "aws_subnet" "simple-vpc-public-subnet-region-a" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    cidr_block = "${var.public_subnet_block_region_a}"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.region}a"
    tags = {
        Name = "simple-vpc-public-subnet"
    }
}

resource "aws_subnet" "simple-vpc-private-subnet-region-a" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    cidr_block = "${var.public_subnet_block_region_a}"
    map_public_ip_on_launch = "false"
    availability_zone = "${var.region}a"
    tags = {
        Name = "simple-vpc-private-subnet"
    }
}


resource "aws_route_table_association" "simple-public-subnet-region-a"{
    subnet_id = "${aws_subnet.simple-vpc-public-subnet-region-a.id}"
    route_table_id = "${aws_route_table.simple-route-table.id}"
}

######## region b ############

resource "aws_subnet" "simple-vpc-public-subnet-region-b" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    cidr_block = "${var.public_subnet_block_region_b}"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.region}b"
    tags = {
        Name = "simple-vpc-public-subnet"
    }
}


resource "aws_subnet" "simple-vpc-private-subnet-region-b" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    cidr_block = "${var.public_subnet_block_region_b}"
    map_public_ip_on_launch = "false"
    availability_zone = "${var.region}b"
    tags = {
        Name = "simple-vpc-private-subnet"
    }
}


resource "aws_route_table_association" "simple-public-subnet-region-b"{
    subnet_id = "${aws_subnet.simple-vpc-public-subnet-region-b.id}"
    route_table_id = "${aws_route_table.simple-route-table.id}"
}
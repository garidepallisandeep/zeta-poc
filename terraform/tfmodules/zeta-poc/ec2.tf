resource "aws_instance" "simple-instance-region-a" {
    ami = "${lookup(var.ami, var.region)}"
    availability_zone = "${var.region}a"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.simple-vpc-public-subnet-region-a.id}"
    vpc_security_group_ids = ["${aws_security_group.simple-security-group.id}"]
}


resource "aws_instance" "simple-instance-region-b" {
    ami = "${lookup(var.ami, var.region)}"
    availability_zone = "${var.region}b"
    instance_type = "${var.instance_type}"
    subnet_id = "${aws_subnet.simple-vpc-public-subnet-region-b.id}"
    vpc_security_group_ids = ["${aws_security_group.simple-security-group.id}"]
}
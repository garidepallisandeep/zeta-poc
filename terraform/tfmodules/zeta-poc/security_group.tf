resource "aws_security_group" "simple-security-group" {
    vpc_id = "${aws_vpc.simple-vpc.id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.default_cidr_block}"]
    }
    ingress {
        from_port = "${var.ssh_port}"
        to_port = "${var.ssh_port}"
        protocol = "tcp"
        cidr_blocks = ["${var.default_cidr_block}"]
    }
    tags = {
        Name = "simple-security-group"
    }
}
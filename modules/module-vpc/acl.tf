#Restrictive acl

resource "aws_network_acl" "vpc_acl_restrictive" {
  count = "${var.vpc_restrictive_acl ? 1 : 0}"

  subnet_ids = [
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}",
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}",
  ]

  vpc_id = "${aws_vpc.main.id}"

  egress {
    protocol   = "-1"
    rule_no    = 1
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name = "acl-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

### Permissive acl

resource "aws_network_acl" "vpc_acl_permissive" {
  count = "${var.vpc_restrictive_acl ? 0 : 1}"

  subnet_ids = [
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}",
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}",
  ]

  vpc_id = "${aws_vpc.main.id}"

  egress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 1
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags {
    Name = "acl-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

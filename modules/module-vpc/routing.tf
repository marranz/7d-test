#####
##
##  Public subnets routes and associations
##
#####

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "public-route-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

#####
##
##  Private subnet routes and associations
##
#####

resource "aws_route_table" "private1" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "private-route-1-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

resource "aws_route" "private1_default" {
  route_table_id            = "${aws_route_table.private1.id}"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.gw1.id}"
}



resource "aws_route_table" "private2" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "private-route-2-${var.vpc_project_name}-${var.vpc_environment}"
  }
}
resource "aws_route" "private2_default" {
  route_table_id            = "${aws_route_table.private2.id}"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.gw2.id}"
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.private1.id}"
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.private2.id}"
}



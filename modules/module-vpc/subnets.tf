resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.vpc_public_subnet_1_cidr_block}"
  availability_zone       = "${element(var.vpc_availability_zones,0)}"
  map_public_ip_on_launch = true

  tags {
    Name = "subnet-public-1-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.vpc_public_subnet_2_cidr_block}"
  availability_zone       = "${element(var.vpc_availability_zones,1)}"
  map_public_ip_on_launch = true

  tags {
    Name = "subnet-public-2-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.vpc_private_subnet_1_cidr_block}"
  availability_zone       = "${element(var.vpc_availability_zones,0)}"
  map_public_ip_on_launch = false

  tags {
    Name = "subnet-private-1-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.vpc_private_subnet_2_cidr_block}"
  availability_zone       = "${element(var.vpc_availability_zones,1)}"
  map_public_ip_on_launch = false

  tags {
    Name = "subnet-private-2-${var.vpc_project_name}-${var.vpc_environment}"
  }
}

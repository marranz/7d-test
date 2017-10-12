resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "igw-${var.vpc_project_name}-${var.vpc_environment}"
  }
}



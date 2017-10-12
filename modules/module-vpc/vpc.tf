resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = "${var.vpc_enable_dns_hostnames}"
  enable_dns_support   = "${var.vpc_enable_dns_support}"

  tags {
    Name = "${var.vpc_project_name}-${var.vpc_environment}"
  }
}

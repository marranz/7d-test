module "vpc" {
  source                          = "../modules/module-vpc/"
  vpc_region                      = "${var.region}"
  vpc_cidr_block                  = "${var.vpc_cidr_block}"
  vpc_project_name                = "${var.project_name}"
  vpc_public_subnet_1_cidr_block  = "${var.vpc_public_subnet_1_cidr_block}"
  vpc_public_subnet_2_cidr_block  = "${var.vpc_public_subnet_2_cidr_block}"
  vpc_private_subnet_1_cidr_block = "${var.vpc_private_subnet_1_cidr_block}"
  vpc_private_subnet_2_cidr_block = "${var.vpc_private_subnet_2_cidr_block}"
  vpc_availability_zones          = [ "${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}" ]

}

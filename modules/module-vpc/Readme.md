This module will deploy the following pieces:


- vpc
- 2 private subnets with only internet output access through nat gateways
- 2 public subnets exposed to internet through a internet gateway
- internet gateway for public subnets
- a nat gateway per private subnet
- a vpc ACL associated with the subnet and vpcs and 
- 1 routing table for public subnet
- 1  routing table per each private subnet


Usage

module "vpc" {
  source  = "git::ssh://git@gitlab.mijack.net/terraform/module-vpc.git"
  vpc_project_name               = "project_name"
  vpc_environment                = "environment"
  vpc_cidr_block                 = "x.x.x.x/x"
  vpc_public_subnet_1_cidr_block = "x.x.x.x/x"
  vpc_public_subnet_2_cidr_block = "x.x.x.x/x"
  vpc_private_subnet_1_cidr_block = "x.x.x.x/x"
  vpc_private_subnet_2_cidr_block = "x.x.x.x/x"
  vpc_availability_zones = ["eu-west-1a","eu-west-1b"]
  vpc_region = "eu-west-1"
}


Changelog:

v1.0: First version





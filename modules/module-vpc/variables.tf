variable "vpc_region" {
  description = "Region where the vpc will be allocated"
}

variable "vpc_cidr_block" {
  description = "cidr block to be assigned to the vpc"
}

variable "vpc_enable_dns_support" {
  description = "enable dns support. true/false"
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  description = "Enable dns hostnames. true/false."
  default     = true
}

variable "vpc_project_name" {
  description = "Name of the project to be appended to the tags"
}

variable "vpc_environment" {
  description = "Name of the environment to be appended to the tags"
  default     = "test"
}

variable "vpc_public_subnet_1_cidr_block" {
  description = ""
}

variable "vpc_public_subnet_2_cidr_block" {
  description = ""
}

variable "vpc_private_subnet_1_cidr_block" {
  description = ""
}

variable "vpc_private_subnet_2_cidr_block" {
  description = ""
}

variable "vpc_availability_zones" {
  type        = "list"
  description = "List of availability zones where subnets will be deployed. At least 2"
}

variable "vpc_restrictive_acl" {
  description = "If true, a restrictive acl will be deployed among the vpc. If false or default, all traffic will be allowed"
  default     = false
}

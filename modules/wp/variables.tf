variable "elb-name" {}

variable "subnets" {
  type = "list"
}

variable "project_name" {}
variable "instance_type" {}
variable "vpc_id" {}

variable "availability_zones" {
  type = "list"
}

variable "asg_desired_capacity" {}
variable "asg_max_size" {}
variable "asg_min_size" {}
variable "db_instance_type" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "wp_package_url" {}

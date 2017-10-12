module "wp" {
  source               = "../modules/wp"
  elb-name             = "${var.project_name}-elb"
  subnets              = ["${module.vpc.public_subnet_1_id}", "${module.vpc.public_subnet_2_id}"]
  project_name         = "${var.project_name}"
  instance_type        = "${var.instance_type}"
  vpc_id               = "${module.vpc.vpc_id}"
  availability_zones   = ["${data.aws_availability_zones.available.names[0]}", "${data.aws_availability_zones.available.names[1]}"]
  asg_max_size         = 1
  asg_min_size         = 0
  asg_desired_capacity = 1
  db_instance_type     = "${var.db_instance_type}"
  db_name              = "${var.db_name}"
  db_password          = "${var.db_password}"
  db_username          = "${var.db_username}"
  wp_package_url       = "https://wordpress.org/wordpress-4.8.2.tar.gz"
}

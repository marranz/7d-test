resource "aws_autoscaling_group" "wp" {
  load_balancers            = ["${aws_elb.elb.id}"]
  availability_zones        = ["${var.availability_zones}"]
  name                      = "${var.project_name}-elb"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = "${var.asg_desired_capacity}"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.wp.name}"
  vpc_zone_identifier       = ["${var.subnets}"]
  health_check_type         = "ELB"
}

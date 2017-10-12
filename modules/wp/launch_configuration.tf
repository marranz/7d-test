resource "aws_launch_configuration" "wp" {
  name_prefix     = "${var.project_name}"
  image_id        = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.instances.id}"]
  user_data       = "${data.template_file.init.rendered}"
  key_name        = "${aws_key_pair.wordpress.key_name}"

  lifecycle {
    create_before_destroy = true
  }
}

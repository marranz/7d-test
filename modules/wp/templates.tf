data "template_file" "init" {
  template = "${file("${path.module}/files/init.tpl")}"

  vars {
    host_name      = "${aws_db_instance.wp.address}"
    password       = "${var.db_password}"
    user_name      = "${var.db_username}"
    db_name        = "${var.db_name}"
    wp_package_url = "${var.wp_package_url}"
    elb_url        = "${aws_elb.elb.dns_name}"
  }
}

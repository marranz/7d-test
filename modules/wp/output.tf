output "init" {
  value = "${data.template_file.init.rendered}"
}

output "address" {
  value = "${aws_elb.elb.dns_name}"
}

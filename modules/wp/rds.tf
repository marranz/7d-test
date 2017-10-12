resource "aws_db_instance" "wp" {
  allocated_storage      = 10
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7.17"
  instance_class         = "${var.db_instance_type}"
  name                   = "${var.db_name}"
  username               = "${var.db_username}"
  password               = "${var.db_password}"
  skip_final_snapshot    = true
  db_subnet_group_name   = "${aws_db_subnet_group.wp.id}"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
}

resource "aws_db_subnet_group" "wp" {
  name       = "main"
  subnet_ids = ["${var.subnets}"]
}

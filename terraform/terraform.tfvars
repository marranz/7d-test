region = "eu-west-1"
project_name = "wp-arranzm"
vpc_cidr_block = "192.168.0.0/16"
vpc_public_subnet_1_cidr_block = "192.168.1.0/24"
vpc_public_subnet_2_cidr_block = "192.168.2.0/24"
vpc_private_subnet_1_cidr_block = "192.168.3.0/24"
vpc_private_subnet_2_cidr_block = "192.168.4.0/24"

instance_type = "t2.micro"
db_instance_type = "db.t2.micro"
db_name = "wordpress"
db_password = "wordpress12345"
db_username = "wordpress"
desired_capacity = 1

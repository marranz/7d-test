
resource "aws_nat_gateway" "gw1" {
  allocation_id = "${aws_eip.nat_gw1.id}"
  subnet_id     = "${aws_subnet.public_subnet_1.id}"
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = "${aws_eip.nat_gw2.id}"
  subnet_id     = "${aws_subnet.public_subnet_2.id}"
}


resource "aws_eip" "nat_gw1" {}
resource "aws_eip" "nat_gw2" {}

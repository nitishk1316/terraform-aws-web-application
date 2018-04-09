# Create a VPC to launch our instances into
resource "aws_vpc" "my_terraform_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "my_terraform_igw" {
  vpc_id = "${aws_vpc.my_terraform_vpc.id}"
}

# Grant the VPC internet access on its main route table
resource "aws_route" "my_terraform_ia" {
  route_table_id         = "${aws_vpc.my_terraform_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.my_terraform_igw.id}"
}

# Create a subnet to launch our instances into
resource "aws_subnet" "my_terraform_subnet_1" {
  vpc_id            = "${aws_vpc.my_terraform_vpc.id}"
  cidr_block        = "${var.subnet_1_cidr}"
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true

  tags {
    Name = "my_frontend_1"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "my_terraform_subnet_2" {
  vpc_id            = "${aws_vpc.my_terraform_vpc.id}"
  cidr_block        = "${var.subnet_2_cidr}"
  availability_zone = "${var.az_2}"
  map_public_ip_on_launch = true

  tags {
    Name = "my_frontend_2"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "my_terraform_subnet_group_1" {
  vpc_id            = "${aws_vpc.my_terraform_vpc.id}"
  cidr_block        = "${var.subnet_group_1_cidr}"
  availability_zone = "${var.az_1}"
  map_public_ip_on_launch = true

  tags {
    Name = "my_db_group_1"
  }
}

# Create a subnet to launch our instances into
resource "aws_subnet" "my_terraform_subnet_group_2" {
  vpc_id            = "${aws_vpc.my_terraform_vpc.id}"
  cidr_block        = "${var.subnet_group_2_cidr}"
  availability_zone = "${var.az_2}"
  map_public_ip_on_launch = true

  tags {
    Name = "my_db_group_2"
  }
}

# Create a subnet group to launch our instances into
resource "aws_db_subnet_group" "my_terraform_mysql" {
  name        = "msql_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${aws_subnet.my_terraform_subnet_group_1.id}", "${aws_subnet.my_terraform_subnet_group_2.id}"]
}

# Create a subnet group to launch our instances into
resource "aws_elasticache_subnet_group" "my_terraform_elasticache" {
  name        = "memcachesubnetgroup"
  description = "Our main group of subnets"
  subnet_ids  = ["${aws_subnet.my_terraform_subnet_group_1.id}", "${aws_subnet.my_terraform_subnet_group_2.id}"]
}
# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "my_terraform_elb" {
  name        = "my_terraform_elb"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.my_terraform_vpc.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Our default security group to access frontend
# the instances over SSH and HTTP
resource "aws_security_group" "my_terraform_frontend" {
  name        = "my_terraform_frontend"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.my_terraform_vpc.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Our default security group to access
# the instances over HTTP
resource "aws_security_group" "my_terraform_rds" {
  name        = "my_terraform_rds"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.my_terraform_vpc.id}"

  # HTTP access from the VPC
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Our default security group to access
# the instances over HTTP
resource "aws_security_group" "my_terraform_memcache" {
  name        = "my_terraform_memcache"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.my_terraform_vpc.id}"

  # HTTP access from the VPC
  ingress {
    from_port   = 11211
    to_port     = 11211
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

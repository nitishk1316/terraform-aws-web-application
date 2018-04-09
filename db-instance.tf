resource "aws_db_instance" "my_terraform_mysql" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.my_terraform_rds.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.my_terraform_mysql.id}"
}
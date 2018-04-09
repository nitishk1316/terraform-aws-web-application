resource "aws_elb" "my_terraform_elb" {
  name = "my-terraform-elb"

  subnets         = ["${aws_subnet.my_terraform_subnet_1.id}", "${aws_subnet.my_terraform_subnet_2.id}"]
  security_groups = ["${aws_security_group.my_terraform_elb.id}"]
  instances       = ["${aws_instance.my_terraform_frontend_1.id}", "${aws_instance.my_terraform_frontend_2.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
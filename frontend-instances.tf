resource "aws_instance" "my_terraform_frontend_1" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
  	type        = "ssh"
    # The default username for our AMI
    user = "ubuntu"

    private_key = "${file(var.private_key_path)}"
    # The connection will use the local SSH agent for authentication.
  }

  instance_type = "t2.micro"

  availability_zone = "${var.az_1}"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.aws_amis}"

  # The name of our SSH keypair we created above.
  key_name = "${aws_key_pair.auth.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.my_terraform_frontend.id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  subnet_id = "${aws_subnet.my_terraform_subnet_1.id}"

  # We run a remote provisioner on the instance after creating it.
  # In this case, we just install nginx and start it. By default,
  # this should be on port 80
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}


resource "aws_instance" "my_terraform_frontend_2" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
  connection {
    type        = "ssh"
    # The default username for our AMI
    user = "ubuntu"

    private_key = "${file(var.private_key_path)}"
    # The connection will use the local SSH agent for authentication.
  }

  instance_type = "t2.micro"

  availability_zone = "${var.az_2}"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.aws_amis}"

  # The name of our SSH keypair we created above.
  key_name = "${aws_key_pair.auth.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.my_terraform_frontend.id}"]

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  subnet_id = "${aws_subnet.my_terraform_subnet_2.id}"

  # We run a remote provisioner on the instance after creating it.
  # In this case, we just install nginx and start it. By default,
  # this should be on port 80
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}

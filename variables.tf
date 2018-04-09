variable "public_key_path" {
 	default     = "~/.ssh/terraform.pub"
  description = <<DESCRIPTION
    Path to the SSH public key to be used for authentication.
    Ensure this keypair is added to your local SSH agent so provisioners can
    connect.
    Example: ~/.ssh/terraform.pub
  DESCRIPTION
}

variable "private_key_path" {
 	default     = "~/.ssh/terraform"
  description = <<DESCRIPTION
    Path to the SSH private key to be used for authentication.
    Ensure this keypair is added to your local SSH agent so provisioners can
    connect.
    Example: ~/.ssh/terraform
  DESCRIPTION
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "NitishTerrform"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

variable "az_1" {
  default     = "AZ 1"
  description = "us-east-2a"
}

variable "az_2" {
  default     = "AZ 2"
  description = "us-east-2b"
}

# Ubuntu Server 16.04 LTS (HVM)
variable "aws_amis" {
  default = "ami-916f59f4"
}

variable "subnet_1_cidr" {
  default     = "10.0.1.0/24"
  description = "us-east-2a"
}

variable "subnet_2_cidr" {
  default     = "10.0.2.0/24"
  description = "us-east-2b"
}

variable "subnet_group_1_cidr" {
  default     = "10.0.3.0/24"
  description = "us-east-2a"
}

variable "subnet_group_2_cidr" {
  default     = "10.0.4.0/24"
  description = "us-east-2b"
}

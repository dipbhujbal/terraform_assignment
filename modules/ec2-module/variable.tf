variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  default = "ec2-ssh-connect"
}

variable "private_key_name" {
  default = "ec2ssh"
}


variable "subnet_id" {}
variable "vpc_security_group_id" {}
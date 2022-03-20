provider "aws" {
  region     = "us-west-2"
  access_key = "123"
  secret_key = "132+321"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.nano" 
    dep     = "t2.micro"
    prod     = "t2.large"
  }
}
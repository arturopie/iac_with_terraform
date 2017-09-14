provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-20160217.1"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "my-instance" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "Hello World"
  }
}

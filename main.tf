provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my-instance" {
  ami = "ami-aa5ebdd2"
  instance_type = "t2.micro"

  tags {
    Name = "Hello World"
  }
}

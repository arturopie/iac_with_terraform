provider "aws" {
  region = "us-east-2"
}

variable "message" {
  default = "Hello, Wolrd"
}

data "aws_ami" "ubuntu" {
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20180306"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "my-instance" {
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "${var.message}" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  vpc_security_group_ids = ["${aws_security_group.my-sg.id}"]
  tags {
    Name = "Hello, World"
  }
}

resource "aws_security_group" "my-sg" {
  name = "example security group"

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_url" {
  value = "${aws_instance.my-instance.public_ip}:8080"
}

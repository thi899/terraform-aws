provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "securitygroup" {
  name = "securitygroup"
  description = "permitir acesso HTTP e acesso a Internet"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 65335
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "keypar" {
  key_name = "terraform-keypar"
  public_key = file("C:/Users/User/.ssh/id_ed25519.pub")
}

resource "aws_instance" "servidor" {
  ami = "ami-00a929b66ed6e0de6"
  instance_type = "t2.nano"
  user_data = file("user_data.sh")
  key_name = aws_key_pair.keypar.key_name
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
}
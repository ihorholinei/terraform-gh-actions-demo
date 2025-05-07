provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    name = "gh-action-vpc"
  }
}

resource "aws_subnet" "test-subnet" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = "10.0.0.0/25"
}

resource "aws_instance" "test-instance" {
  ami = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.test-subnet.id

  tags = {
    Name = "gh-action-instance"
  }
}




# Creating VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  tags = {
    Name = "Demo VPC"
  }
}

resource "aws_subnet" "websubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.websubnet}"

  tags = {
    Name = "websubnet"
  }
}

resource "aws_subnet" "appsubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.appsubnet}"

  tags = {
    Name = "appsubnet"
  }
}

resource "aws_subnet" "dbsubnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.dbsubnet-1}"
  availability_zone = "ca-central-1a"

  tags = {
    Name = "dbsubnet"
  }
}

resource "aws_subnet" "dbsubnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.dbsubnet-2}"
  availability_zone = "ca-central-1b"

  tags = {
    Name = "dbsubnet"
  }
}

resource "aws_network_interface" "web-nic" {
  subnet_id   = aws_subnet.websubnet.id
  #private_ips = ["172.16.10.100"]

  tags = {
    Name = "web-nic"
  }
}

resource "aws_network_interface" "app-nic" {
  subnet_id   = aws_subnet.appsubnet.id
  #private_ips = ["172.16.10.100"]

  tags = {
    Name = "app-nic"
  }
}

resource "aws_security_group" "demosg" {
  vpc_id = "${aws_vpc.main.id}"
# Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# HTTPS access from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "Web SG"
  }
}



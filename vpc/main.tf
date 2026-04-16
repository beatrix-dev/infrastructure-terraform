resource "aws_vpc" "vpc" {
cidr_block = "10.10.0.0/16"
tags = {
  name = "${var.client}-vpc"
}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    name = "${var.client}-vpc"
  }
}

resource "aws_internet_gateway_attachment" "igw-attached" {
    internet_gateway_id = aws_internet_gateway.igw.id
    vpc_id = aws_vpc.vpc.id
  
}

#### Subnets #######

resource "aws_subnet" "public-1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.cidr}.1.0/24"
    availability_zone = "eu-west-1a"
}

resource "aws_subnet" "public-1b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.cidr}.2.0/24"
    availability_zone = "eu-west-1b"
}

resource "aws_subnet" "private-1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.cidr}.3.0/24"
    availability_zone = "eu-west-1a"
}

resource "aws_subnet" "private-1b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.cidr}.4.0/24"
    availability_zone = "eu-west-1b"
}


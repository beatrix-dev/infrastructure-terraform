/*------------ VPC CIDR -------------- */

resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "${var.client}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.client}-igw"
  }
}



/*------------ Public Subnets -------------- */


resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.cidr}.1.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "${var.client}-public-1a"
  }
}

resource "aws_subnet" "public-1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.cidr}.1.0/24"
    availability_zone = "eu-west-1a"
        tags = {
      Name = "${var.client}-public1b"
    }
}

/*------------ Private Subnets -------------- */

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.cidr}.3.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "${var.client}-private-1a"
  }
}


resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${var.cidr}.4.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    Name = "${var.client}-private-1b"
  }
}

/*------------ Public Route Table Subnets and NACL -------------- */


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.vpc.id


}

resource "aws_route_table_association" "public_rt_association_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public_rt.id

}

resource "aws_route_table_association" "public_rt_association_1b" {
  subnet_id      = aws_subnet.public_1b.id
  route_table_id = aws_route_table.public_rt.id
}


/*------------ Private Route Table Subnets and NACL -------------- */

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {}
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "private_rt_association_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_association_1b" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_1b.id
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.vpc.id

    route {}
  
}

resource "aws_route_table_association" "private_rt_association_1a" {
    subnet_id = aws_subnet.public-1a.id
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "private_rt_association_1b" {
    subnet_id = aws_subnet.public-1b.id
    route_table_id = aws_route_table.public_rt.id
}



resource "aws_network_acl" "private_nacl" {
    vpc_id = aws_vpc.vpc.id

  
}

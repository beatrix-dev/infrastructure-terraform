output "vpc" {
value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = [ aws_subnet.public-1a, aws_subnet_public-1b]
}

output "private_subnets" {
  value = [ aws_subnet.private-1a, aws_subnet_private-1b]
}
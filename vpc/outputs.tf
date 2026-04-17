output "vpc" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public-1a.id,
    aws_subnet.public-1b.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private-1a.id,
    aws_subnet.private-1b.id
  ]
}
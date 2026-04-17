output "vpc" {
value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = {
    public_subnet_1a = aws_subnet.public_1a.id,
    public_subnet_1b = aws_subnet.public_1b.id
  }
}

output "private_subnet_ids" {
  value = {
   private_subnet_1a = aws_subnet.private_1a.id,
   private_subnet_1a = aws_subnet.private_1b.id
  }
}

/* 

output "public_subnets" {
  value = {
    alb_1a      = aws_subnet.alb_1a.id
    alb_1b      = aws_subnet.alb_1b.id
  }
}

output "private_subnets" {
  value = {
    frontend_1a = aws_subnet.frontend_1a.id
    backend_1a  = aws_subnet.backend_1a.id
    rds_1a      = aws_subnet.rds_1a.id
    efs_1a      = aws_subnet.efs_1a.id
  }
}




*/
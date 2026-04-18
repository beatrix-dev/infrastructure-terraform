resource "aws_db_instance" "rds_instance" {
  allocated_storage    = var.storage
  db_name              = var.databaseName
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_size
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  storage_encrypted    = true
}


resource "aws_db_subnet_group" "rds_subnet" {
  name       = "main"
  subnet_ids = values(data.terraform_remote_state.vpc.outputs.private_subnet_ids)


  tags = {
    Name = "My DB subnet group"
  }
}

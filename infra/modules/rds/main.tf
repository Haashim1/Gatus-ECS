resource "aws_db_subnet_group" "this" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "${var.name_prefix}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "${var.name_prefix}-db-instance"
  allocated_storage       = var.allocated_storage
  engine                  = "postgres"
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name =                   var.db_name
  username                = var.db_username
  manage_master_user_password = true
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.rds_sg_id]
  multi_az                = var.multi_az
  skip_final_snapshot     = true
  storage_encrypted       = true
  publicly_accessible     = false
  deletion_protection     = false
  storage_type            = "gp3"

  tags = {
    Name = "${var.name_prefix}-db-instance"
  }
}


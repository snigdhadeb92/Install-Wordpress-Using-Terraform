############# DB Instance Creation ##############
resource "aws_db_instance" "db_instance" {
  allocated_storage        = 20
  engine                   = var.engine_name
  instance_class           = var.instance_class
  name                     = var.db_name
  username                 = var.username
  password                 = var.password
  skip_final_snapshot      = var.skip_final_snapshot
  db_subnet_group_name     = aws_db_subnet_group.db_subnet_group.id
  multi_az                 = var.multi_az_deployment
  publicly_accessible      = var.publicly_accessible
  delete_automated_backups = var.delete_automated_backups
  vpc_security_group_ids   = [data.aws_security_group.sg.id]
}
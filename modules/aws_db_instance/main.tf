resource "aws_db_instance" "db_instance" {
  instance_class = var.instance_class
  engine = var.engine
  engine_version = var.engine_version
  multi_az = var.multi_az
  storage_type = var.storage_type
  allocated_storage = var.allocated_storage
  name = var.name
  username = var.username
  password = var.password
  apply_immediately = var.apply_immediately
  backup_retention_period = var.backup_retention_period
  #backup_window = var.backup_window
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot = var.skip_final_snapshot
  identifier = var.identifier
}
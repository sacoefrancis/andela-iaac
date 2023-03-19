module "aws_db_instance" {
  source = "../../modules/aws_db_instance"
  
  instance_class = local.variables[terraform.workspace].db_instance.instance_class
  engine 	 = local.variables[terraform.workspace].db_instance.engine
  engine_version = local.variables[terraform.workspace].db_instance.engine_version
  multi_az       = local.variables[terraform.workspace].db_instance.multi_az
  storage_type   = local.variables[terraform.workspace].db_instance.storage_type
  allocated_storage = local.variables[terraform.workspace].db_instance.allocated_storage
  name              = local.variables[terraform.workspace].db_instance.name
  username          = local.variables[terraform.workspace].db_instance.username
  password          = local.variables[terraform.workspace].db_instance.password
  apply_immediately = local.variables[terraform.workspace].db_instance.apply_immediately
  backup_retention_period = local.variables[terraform.workspace].db_instance.backup_retention_period
 # backup_window          = local.variables[terraform.workspace].db_instance.backup_window
  db_subnet_group_name    = module.aws_db_subnet_group.id
  vpc_security_group_ids   = [module.rds_security_group.id]
  identifier = local.variables[terraform.workspace].db_instance.identifier
  skip_final_snapshot = local.variables[terraform.workspace].db_instance.skip_final_snapshot
}
 
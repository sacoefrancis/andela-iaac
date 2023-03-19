module "aws_db_subnet_group" {
  source = "../../modules/aws_db_subnet_group"

  
  db_subnet_group_name  = local.variables[terraform.workspace].db_subnet_group.db_subnet_group_name
  subnet_ids = [module.aws_subnet["private_subnet1"].id, module.aws_subnet["private_subnet2"].id]
  tags = local.variables[terraform.workspace].db_subnet_group.tags
   
}
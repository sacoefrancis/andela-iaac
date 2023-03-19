module "route_table" {
  source = "../../modules/route_table"

  vpc_id     = module.vpc.id
  cidr_block = local.variables[terraform.workspace].route_table.cidr_block
  gateway_id = module.internet_gateway.id
  tags       = local.variables[terraform.workspace].route_table.tags
}
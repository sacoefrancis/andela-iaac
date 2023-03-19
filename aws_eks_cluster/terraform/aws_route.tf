module "route" {
  source = "../../modules/route"

  route_table_id         = data.aws_vpc.vpc.main_route_table_id
  destination_cidr_block = local.variables[terraform.workspace].route.destination_cidr_block
  nat_gateway_id         = module.nat_gateway.id
}
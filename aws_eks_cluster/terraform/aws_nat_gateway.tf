module "nat_gateway" {
  source = "../../modules/nat_gateway"

  allocation_id = module.eip.id
  subnet_id     = module.subnet[local.variables[terraform.workspace].nat_gateway.subnet].id
  tags          = local.variables[terraform.workspace].nat_gateway.tags
}
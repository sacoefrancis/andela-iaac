module "route_table_association" {
  source = "../../modules/route_table_association"

  for_each = { for key, value in local.variables[terraform.workspace].subnet : key => key
  if value.map_public_ip_on_launch == true }
  subnet_id      = module.subnet[each.value].id
  route_table_id = local.variables[terraform.workspace].route_table_id.id
}
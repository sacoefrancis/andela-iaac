# output "test_values" {
#   # value = [for rule_key, rule_value in local.variables[terraform.workspace].security_group.data_plane_sg.ingresses:
#   #   { description = rule_value.description
#   #     from_port = rule_value.from_port 
#   #     to_port = rule_value.to_port 
#   #     protocol = rule_value.protocol 
#   #     cidr_blocks = flatten([[rule_value.cidr_blocks], 
#   #     [for key, value in local.variables[terraform.workspace].subnet: value.cidr_block 
#   #     if rule_value.public_subnet && value.map_public_ip_on_launch == true],
#   #     [for key, value in local.variables[terraform.workspace].subnet: value.cidr_block 
#   #     if rule_value.private_subnet && value.map_public_ip_on_launch == false]])}]
#   value = [for rule_key, rule_value in local.variables[terraform.workspace].security_group: rule_value.ingresses]
# }

# output "subnets" {
#   value = [for key, value in data.aws_subnet.subnet: value.tags.Name]
# }

output "vpc_id" {
  value = data.aws_vpc.vpc.main_route_table_id 
}

# output "security_groups" {
#   value = data.aws_security_groups.security_groups.ids
# }

output "subnets" {
  value = module.subnet
}
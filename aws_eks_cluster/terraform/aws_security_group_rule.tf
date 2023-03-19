module "security_group_rule" {
  source = "../../modules/security_group_rule"

  for_each                 = local.variables[terraform.workspace].security_group_rule
  description              = each.value.description
  from_port                = each.value.from_port
  protocol                 = each.value.protocol
  security_group_id        = module.security_group[each.value.security_group_id].id
  source_security_group_id = module.security_group[each.value.source_security_group_id].id
  to_port                  = each.value.to_port
  type                     = each.value.type
}
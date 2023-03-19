module "security_group" {
  source = "../../modules/security_group"

  for_each = local.variables[terraform.workspace].security_group
  sg_name  = each.value.sg_name
  vpc_id   = module.vpc.id
  ingresses = try([for ingress_rule in each.value.ingresses :
    { description = ingress_rule.description
      from_port   = ingress_rule.from_port
      to_port     = ingress_rule.to_port
      protocol    = ingress_rule.protocol
      cidr_blocks = try(flatten([[ingress_rule.cidr_blocks],
        [for key, value in local.variables[terraform.workspace].subnet : value.cidr_block
        if ingress_rule.public_subnet && value.map_public_ip_on_launch == true],
        [for key, value in local.variables[terraform.workspace].subnet : value.cidr_block
  if ingress_rule.private_subnet && value.map_public_ip_on_launch == false]]), null) }], [])

  egresses = try(each.value.egresses, [])
  tags     = each.value.tags
}
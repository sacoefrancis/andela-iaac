module "rds_security_group" {
  source = "../../modules/rds_security_group"
  
security_group_name 	= local.variables[terraform.workspace].security_group.security_group_name
vpc_id   		= data.aws_vpc.vpc.id
egress_from_port = local.variables[terraform.workspace].security_group.egress_from_port
egress_to_port = local.variables[terraform.workspace].security_group.egress_to_port
egress_protocol = local.variables[terraform.workspace].security_group.egress_protocol
egress_cidr_blocks = local.variables[terraform.workspace].security_group.egress_cidr_blocks
ingress_from_port = local.variables[terraform.workspace].security_group.ingress_from_port
ingress_to_port = local.variables[terraform.workspace].security_group.ingress_to_port
ingress_protocol = local.variables[terraform.workspace].security_group.ingress_protocol
ingress_cidr_blocks =local.variables[terraform.workspace].security_group.ingress_cidr_blocks 
 tags = {
    Name = local.variables[terraform.workspace].security_group.security_group_name
  }
}
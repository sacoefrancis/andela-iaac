module "vpc" {
  source = "../../modules/vpc"

  cidr_block           = local.variables[terraform.workspace].vpc.cidr_block
  enable_dns_support   = local.variables[terraform.workspace].vpc.enable_dns_support
  enable_dns_hostnames = local.variables[terraform.workspace].vpc.enable_dns_hostnames
  tags                 = local.variables[terraform.workspace].vpc.tags
}

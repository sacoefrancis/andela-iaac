module "subnet" {
  source = "../../modules/subnet"

  for_each                = local.variables[terraform.workspace].subnet
  vpc_id                  = module.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}
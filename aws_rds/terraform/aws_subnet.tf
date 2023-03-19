module "aws_subnet" {
  source = "../../modules/rds_subnet"

  for_each                = local.variables[terraform.workspace].subnet
  vpc_id                  = data.aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  tags                    = each.value.tags
}
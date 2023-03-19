data "aws_vpc" "vpc" {
  id = local.variables[terraform.workspace].vpc.vpc_id
}

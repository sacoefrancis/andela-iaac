module "internet_gateway" {
  source = "../../modules/internet_gateway"

  vpc_id = module.vpc.id
  tags   = local.variables[terraform.workspace].internet_gateway.tags
}
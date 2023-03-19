module "eip" {
  source = "../../modules/eip"

  vpc = local.variables[terraform.workspace].eip.vpc
}
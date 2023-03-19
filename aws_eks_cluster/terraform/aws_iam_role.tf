module "iam_roles" {
  source = "../../modules/iam_role"

  for_each           = local.variables[terraform.workspace].iam_roles
  iam_role_name      = each.value.iam_role_name
  assume_role_policy = each.value.assume_role_policy
}
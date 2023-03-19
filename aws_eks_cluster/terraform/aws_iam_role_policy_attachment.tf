module "iam_role_policy_attachment" {
  source = "../../modules/iam_role_policy_attachment"

  for_each = {
    for permission in local.permissionsbyrole : "${permission.role_name}.${permission.policy}}" => permission
  }
  role       = module.iam_roles[each.value.role_name].name
  policy_arn = each.value.policy
}
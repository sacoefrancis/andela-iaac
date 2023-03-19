locals {
  permissionsbyrole = flatten([
    for roleName, permlist in local.variables[terraform.workspace].iam_role_policy_attachments : [
      for policy in permlist : {
        role_name = roleName
        policy    = policy
      }
    ]
  ])
}
module "eks_cluster" {
  source = "../../modules/eks_cluster"

  eks_cluster_name        = local.variables[terraform.workspace].eks_cluster.eks_cluster_name
  role_arn                = module.iam_roles[local.variables[terraform.workspace].eks_cluster.role_arn].arn
  security_group_ids      = [for value in local.variables[terraform.workspace].eks_cluster.security_group_ids: module.security_group[value].id]
  endpoint_private_access = local.variables[terraform.workspace].eks_cluster.endpoint_private_access
  endpoint_public_access  = local.variables[terraform.workspace].eks_cluster.endpoint_public_access
  eks_cluster_subnet_ids = [for key, value in local.variables[terraform.workspace].subnet: module.subnet[key].id]
  dependencies = [
    module.iam_role_policy_attachment
  ]
}

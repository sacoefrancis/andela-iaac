module "iam_openid_connect_provider" {
  source = "../../modules/iam_openid_connect_provider"

  client_id_list  = local.variables[terraform.workspace].iam_openid_connect_provider.client_id_list
  thumbprint_list = local.variables[terraform.workspace].iam_openid_connect_provider.thumbprint_list
  url             = module.eks_cluster.identity.0.oidc.0.issuer
}
resource "aws_iam_openid_connect_provider" "iam_openid_connect_provider" {
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list
  url             = var.url
}
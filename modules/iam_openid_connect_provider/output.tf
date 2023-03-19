output "arn" {
  value       = aws_iam_openid_connect_provider.iam_openid_connect_provider.arn
  description = "The ARN assigned by AWS for this provider."
}
resource "aws_eip" "eip" {
  vpc = var.vpc
}
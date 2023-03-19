resource "aws_security_group_rule" "security_group_rule" {
  description              = var.description
  from_port                = var.from_port
  protocol                 = var.protocol
  security_group_id        = var.security_group_id
  source_security_group_id = var.source_security_group_id
  to_port                  = var.to_port
  type                     = var.type
}
output "id" {
  value = aws_instance.virtual-machine.id
}

output "vpc_security_group_ids" {
  description = "ID of the security group."
  value       = aws_instance.virtual-machine.vpc_security_group_ids
}

output "security_groups" {
  description = "List of associated security groups of instances"
  value       = aws_instance.virtual-machine.security_groups
}
output "arn" {
  value = aws_db_instance.db_instance.arn
  description = " The ARN of the RDS instance."
}

output "id" {
  value = aws_db_instance.db_instance.id
  description = "The RDS instance ID."
}
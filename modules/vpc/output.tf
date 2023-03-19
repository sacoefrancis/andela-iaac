output "id" {
  value       = aws_vpc.vpc.id
  description = "The ID of the VPC"
}

output "main_route_table_id" {
  value       = aws_vpc.vpc.main_route_table_id
  description = "The ID of the main route table associated with this VPC."
}
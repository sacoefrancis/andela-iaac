variable "route_table_id" {
  description = "(Required) The ID of the routing table."
}

variable "destination_cidr_block" {
  description = "(Optional) The destination CIDR block."
}

variable "nat_gateway_id" {
  description = "(Optional) Identifier of a VPC NAT gateway."
}

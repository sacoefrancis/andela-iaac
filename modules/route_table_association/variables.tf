variable "subnet_id" {
  description = "(Optional) The subnet ID to create an association. Conflicts with gateway_id."
}

variable "route_table_id" {
  description = "(Required) The ID of the routing table to associate with."
}

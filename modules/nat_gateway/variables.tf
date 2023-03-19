variable "allocation_id" {
  description = "(Optional) The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public."
}

variable "subnet_id" {
  description = "(Required) The Subnet ID of the subnet in which to place the gateway."
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

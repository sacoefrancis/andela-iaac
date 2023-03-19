variable "vpc_id" {
  description = "(Required) The VPC ID."
}

variable "cidr_block" {
  description = "(Required) The CIDR block of the route."
}

variable "gateway_id" {
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

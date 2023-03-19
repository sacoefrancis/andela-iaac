variable "cidr_block" {
  description = "(Required) The CIDR block for the VPC."
}

variable "enable_dns_support" {
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true."
}

variable "enable_dns_hostnames" {
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "security_group_name" {
  type = string
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name."
}

variable "vpc_id" {
  type = string
  description = "(Optional, Forces new resource) VPC ID."
}

variable "egress_from_port" {
  type = number
  description = "(Required) Start port (or ICMP type number if protocol is icmp)"
}

variable "egress_to_port" {
  type = number
  description = "(Required) End range port (or ICMP code if protocol is icmp)."
}

variable "egress_protocol" {
  type = string
  description = "(Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument in the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using Terraform 0.12.x and above. Please make sure that the value of the protocol is specified as lowercase when used with older version of Terraform to avoid issues during upgrade."
}

variable "egress_cidr_blocks" {
  type = list(string)
  description = "(Optional) List of CIDR blocks."
}

variable "ingress_from_port" {
  type = number
  description = "(Required) Start port (or ICMP type number if protocol is icmp or icmpv6)."
}

variable "ingress_to_port" {
  type = number
  description = "(Required) End range port (or ICMP code if protocol is icmp)."
}

variable "ingress_protocol" {
  type = string
  description = "(Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument on the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using with Terraform 0.12.x and above, please make sure that the value of the protocol is specified as lowercase when using with older version of Terraform to avoid an issue during upgrade."
}

variable "ingress_cidr_blocks" {
  type = list(string)
  description = "(Optional) List of CIDR blocks."
}

variable "tags" {
  type = map(any)
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
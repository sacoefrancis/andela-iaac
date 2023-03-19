variable "from_port" {
  description = "(Required) Start port (or ICMP type number if protocol is 'icmp' or 'icmpv6')."
}

variable "protocol" {
  description = "(Required) Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
}

variable "security_group_id" {
  description = "(Required) Security group to apply this rule to."
}

variable "source_security_group_id" {
  description = "(Optional) Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self."
}

variable "to_port" {
  description = "(Required) End port (or ICMP code if protocol is 'icmp')."
}

variable "type" {
  description = "(Required) Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "description" {
  description = "(Optional) Description of the rule."
}
variable "sg_name" {
  description = "(Optional, Forces new resource) Name of the security group. If omitted, Terraform will assign a random, unique name."
}

variable "vpc_id" {
  description = "(Optional, Forces new resource) VPC ID."
}

variable "ingresses" {
  description = "(Optional) Configuration block for ingress rules. Can be specified multiple times for each ingress rule. Each ingress block supports fields documented below. This argument is processed in attribute-as-blocks mode."
}

variable "egresses" {
  description = "(Optional, VPC only) Configuration block for egress rules. Can be specified multiple times for each egress rule. Each egress block supports fields documented below. This argument is processed in attribute-as-blocks mode."
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

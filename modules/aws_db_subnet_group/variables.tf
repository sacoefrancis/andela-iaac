variable "db_subnet_group_name" {
  description = "(Optional, Forces new resource) The name of the DB subnet group. If omitted, Terraform will assign a random, unique name."
}

variable "subnet_ids" {
  description = "(Required) A list of VPC subnet IDs."
}


variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}


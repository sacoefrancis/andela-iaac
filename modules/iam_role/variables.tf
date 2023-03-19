variable "iam_role_name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name. See IAM Identifiers for more information."
}

variable "assume_role_policy" {
  description = "(Required) Policy that grants an entity permission to assume the role."
}

variable "tags" {
  type        = map(any)
  description = "Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}
variable "vpc_id" {
  description = "(Required) The VPC ID."
}

variable "cidr_block" {
  description = "(Required) The CIDR block for the subnet."
}

variable "availability_zone" {
  description = "(Optional) The AZ for the subnet."
}

variable "map_public_ip_on_launch" {
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

# variable "shared" {
#   description = "custom tag"
# }

# variable "internal_elb" {
#   description = "custom tag"
# }

# variable "eks_cluster_name" {
#   description = "name of the cluster"
# }

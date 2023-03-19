variable "cluster_name" {
  description = "(Required) Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-_]+$)."
}

variable "node_group_name" {
  description = "(Optional) Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name. Conflicts with node_group_name_prefix."
}

variable "node_role_arn" {
  description = "(Required) Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
}

variable "subnet_ids" {
  description = "(Required) Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
}

variable "ami_type" {
  description = "(Optional) Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM. Terraform will only perform drift detection if a configuration value is provided."
}

variable "disk_size" {
  description = "(Optional) Disk size in GiB for worker nodes. Defaults to 20. Terraform will only perform drift detection if a configuration value is provided."
}

variable "instance_types" {
  description = "(Optional) Set of instance types associated with the EKS Node Group. Defaults to ['t3.medium']. Terraform will only perform drift detection if a configuration value is provided."
}

variable "desired_size" {
  description = "(Required) Desired number of worker nodes."
}

variable "max_size" {
  description = "(Required) Maximum number of worker nodes."
}

variable "min_size" {
  description = "(Required) Minimum number of worker nodes."
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "dependencies" {
  description = "describe your variable"
}

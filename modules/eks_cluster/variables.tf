variable "eks_cluster_name" {
  description = "(Required) Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9\\-_]+$)."
}

variable "role_arn" {
  description = "(Required) ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf. Ensure the resource configuration includes explicit dependencies on the IAM Role permissions by adding depends_on if using the aws_iam_role_policy resource or aws_iam_role_policy_attachment resource, otherwise EKS cannot delete EKS managed EC2 infrastructure such as Security Groups on EKS Cluster deletion."
}

variable "security_group_ids" {
  description = "(Optional) List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "endpoint_private_access" {
  description = "(Optional) Whether the Amazon EKS private API server endpoint is enabled. Default is false."
}

variable "endpoint_public_access" {
  description = "(Optional) Whether the Amazon EKS public API server endpoint is enabled. Default is true."
}

variable "eks_cluster_subnet_ids" {
  description = "(Required) List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "dependencies" {
  description = "describe your variable"
}

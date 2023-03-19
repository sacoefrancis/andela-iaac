output "id" {
  value       = aws_eks_node_group.eks_node_group.id
  description = "EKS Cluster name and EKS Node Group name separated by a colon (:)."
}
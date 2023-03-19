output "id" {
  value       = aws_eks_cluster.eks_cluster.id
  description = "Name of the cluster."
}

output "identity" {
  value       = aws_eks_cluster.eks_cluster.identity
  description = "Attribute block containing identity provider information for your cluster. Only available on Kubernetes version 1.13 and 1.14 clusters created or upgraded on or after September 3, 2019. Detailed below."
}
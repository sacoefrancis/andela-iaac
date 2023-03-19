module "eks_node_group" {
  source = "../../modules/eks_node_group"

  cluster_name    = module.eks_cluster.id
  node_group_name = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.node_group_name
  node_role_arn   = module.iam_roles[local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.node_role_arn].arn
  subnet_ids = flatten([ 
      [for key, value in local.variables[terraform.workspace].subnet: module.subnet[key].id 
      if local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.public_subnet && value.map_public_ip_on_launch == true],
      [for key, value in local.variables[terraform.workspace].subnet: module.subnet[key].id 
      if local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.private_subnet && value.map_public_ip_on_launch == false]])
  ami_type       = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.ami_type
  disk_size      = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.disk_size
  instance_types = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.instance_types
  desired_size   = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.desired_size
  max_size       = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.max_size
  min_size       = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.min_size
  tags = {
    Name = local.variables[terraform.workspace].eks_node_group.eks_node_group_initial.tags
  }
  dependencies = [
    module.iam_role_policy_attachment
  ]
}
module "eks_node_group_gpu" {
  source = "../../modules/eks_node_group"

  cluster_name    = module.eks_cluster.id
  node_group_name = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.node_group_name
  node_role_arn   = module.iam_roles[local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.node_role_arn].arn
  subnet_ids = flatten([ 
      [for key, value in local.variables[terraform.workspace].subnet: module.subnet[key].id 
      if local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.public_subnet && value.map_public_ip_on_launch == true],
      [for key, value in local.variables[terraform.workspace].subnet: module.subnet[key].id 
      if local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.private_subnet && value.map_public_ip_on_launch == false]])
  ami_type       = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.ami_type
  disk_size      = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.disk_size
  instance_types = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.instance_types
  desired_size   = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.desired_size
  max_size       = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.max_size
  min_size       = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.min_size
  tags = {
    Name = local.variables[terraform.workspace].eks_node_group.eks_node_group_gpu.tags
  }
  dependencies = [
    module.iam_role_policy_attachment
  ]
}

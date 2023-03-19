# andela-iaac

AWS EKS Cluster with Terraform
Overview
This Terraform module provides an example implementation of an Amazon Elastic Kubernetes Service (EKS) cluster. The module provisions the following resources:

An Amazon EKS control plane
A VPC with private and public subnets
Worker nodes in an auto-scaling group (ASG)
A security group for worker nodes

     +-------------------------------------------------+
     |                                                 |
     |                                                 |
     |                      VPC                        |
     |                                                 |
     |                                                 |
     |  +-------------------------------------------+  |
     |  |             Public Subnets                |  |
     |  +------------------+------------------------+  |
     |                     |                             |
     |  +------------------+------------------------+  |
     |  |             Private Subnets               |  |
     |  +------------------+------------------------+  |
     |                                                 |
     |         +-----------------------------+         |
     |         |  Amazon EKS Control Plane    |         |
     |         +-----------------------------+         |
     |                                                 |
     |         +---------------------------------+     |
     |         |       Worker Nodes in ASG       |     |
     |         +---------------------------------+     |
     |                                                 |
     |                +----------------+               |
     |                | Worker Node SG |               |
     |                +----------------+               |
     |                                                 |
     +-------------------------------------------------+

Prerequisites
An AWS account
Terraform version 1.3.7 or later
AWS CLI
kubectl
AWS IAM Authenticator
Usage
The Terraform module can be invoked using the following code:

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name      = "my-eks-cluster"
  subnets           = ["subnet-0xxxxx", "subnet-1yyyyy", "subnet-2zzzzz"]
  tags              = {
    Terraform   = "true",
    Environment = "dev",
  }
}

Variables
cluster_name (string): The name of the EKS cluster.
subnets (list): A list of subnet IDs in which to create the EKS cluster.
tags (map): A map of tags to apply to all resources.
Outputs:
kubeconfig: The contents of the kubeconfig file needed to access the EKS cluster.
config_map_aws_auth: The contents of the config-map-aws-auth ConfigMap needed to allow worker nodes to join the EKS cluster.

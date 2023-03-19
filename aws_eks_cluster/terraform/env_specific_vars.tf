locals {
  variables = {
    default = {
      vpc = {
        vpc_id = "vpc-0a4a4fc17cd3dcd1f"
      }
      route_table_id = {
        id = "rtb-0b7a1840369b83808"
      }
      subnet = {
        private_subnet1 = {
          cidr_block              = "10.11.0.0/24"
          availability_zone       = "ap-south-1a"
          map_public_ip_on_launch = false
          tags = {
            Name                                                     = "Custom Kubernetes cluster private subnet"
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
            "kubernetes.io/role/internal-elb"                        = 1
          }
        },
        private_subnet2 = {
          cidr_block              = "10.11.1.0/24"
          availability_zone       = "ap-south-1b"
          map_public_ip_on_launch = false
          tags = {
            Name                                                     = "Custom Kubernetes cluster private subnet"
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
            "kubernetes.io/role/internal-elb"                        = 1
          }
        },
        public_subnet1 = {
          cidr_block              = "10.11.2.0/24"
          availability_zone       = "ap-south-1a"
          map_public_ip_on_launch = true
          tags = {
            Name                                                     = "Custom Kubernetes cluster public subnet"
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
            "kubernetes.io/role/internal-elb"                        = 1
          }
        },
        public_subnet2 = {
          cidr_block              = "10.11.3.0/24"
          availability_zone       = "ap-south-1b"
          map_public_ip_on_launch = true
          tags = {
            Name                                                     = "Custom Kubernetes cluster public subnet"
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
            "kubernetes.io/role/internal-elb"                        = 1
          }
        }
      }
      internet_gateway = {
        tags = {
          Name = "eks_module"
        }
      }
      route_table = {
        cidr_block = "0.0.0.0/0"
        tags = {
          Name = "eks_module"
        }
      }
      eip = {
        vpc = true
      }
      nat_gateway = {
        subnet = "public_subnet1"
        tags = {
          Name = "NAT Gateway for Custom Kubernetes Cluster"
        }
      }
      route = {
        destination_cidr_block = "0.0.0.0/0"
      }
      security_group = {
        control_plane_sg = {
          sg_name = "k8s-control-plane-sg"
          tags = {
            Name = "k8s-control-plane-sg"
          }

          ingresses = [
            {
              description    = "description"
              from_port      = 0
              to_port        = 65535
              protocol       = "tcp"
              cidr_blocks    = []
              private_subnet = true
              public_subnet  = true
            },
          ]
          egresses = [
            {
              description = "description"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
            }
          ]
        },
        data_plane_sg = {
          sg_name = "k8s-data-plane-sg"
          tags = {
            Name = "k8s-data-plane-sg"
          }

          ingresses = [
            {
              description    = "Allow nodes to communicate with each other"
              from_port      = 0
              to_port        = 0
              protocol       = "-1"
              cidr_blocks    = []
              private_subnet = true
              public_subnet  = true
            },
            {
              description    = "Allow nodes to communicate with each other"
              from_port      = 1025
              to_port        = 65535
              protocol       = "tcp"
              cidr_blocks    = []
              private_subnet = true
              public_subnet  = false
            }
          ]
          egresses = [
            {
              description = "description"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
            }
          ]
        },
        cluster_public_sg = {
          sg_name = "cluster-public-sg"
          tags = {
            Name = "public-sg"
          }

          ingresses = [
            {
              description    = "HTTP"
              from_port      = 80
              to_port        = 80
              protocol       = "tcp"
              cidr_blocks    = ["0.0.0.0/0"]
              private_subnet = false
              public_subnet  = false
            },
            {
              description    = "HTTPS"
              from_port      = 443
              to_port        = 443
              protocol       = "tcp"
              cidr_blocks    = ["0.0.0.0/0"]
              private_subnet = false
              public_subnet  = false
            },
            {
              description    = "SSH"
              from_port      = 22
              to_port        = 22
              protocol       = "tcp"
              cidr_blocks    = ["0.0.0.0/0"]
              private_subnet = false
              public_subnet  = false
            }
          ]
          egresses = [
            {
              description = "description"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
            }
          ]
        },
        node_sg = {
          sg_name = format("%s-node-sg", var.eks_cluster_name)
          tags = {
            Name                                                     = format("%s-node-sg", var.eks_cluster_name)
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "owned"
          }
          ingress = [
          {
              description    = "HTTPS"
              from_port      = 443
              to_port        = 443
              protocol       = "tcp"
              cidr_blocks    = ["0.0.0.0/0"]
              private_subnet = true
              public_subnet  = false
            }
          ]
          egresses = [
            {
              description = "description"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
            }
          ]
        },
        cluster_sg = {
          sg_name = format("%s-cluster-sg", var.eks_cluster_name)
          tags = {
            Name = format("%s-cluster-sg", var.eks_cluster_name)
          }
        }
      }
      security_group_rule = {
        node_inbound1 = {
          description              = "Allow nodes to communicate with each other"
          from_port                = 0
          protocol                 = "-1"
          security_group_id        = "node_sg"
          source_security_group_id = "node_sg"
          to_port                  = 65535
          type                     = "ingress"
        },
        node_inbound2 = {
          description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
          from_port                = 1025
          protocol                 = "tcp"
          security_group_id        = "node_sg"
          source_security_group_id = "cluster_sg"
          to_port                  = 65535
          type                     = "ingress"
        },
        node_inbound3 = {
          description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
          from_port                = 443
          protocol                 = "tcp"
          security_group_id        = "node_sg"
          source_security_group_id = "cluster_sg"
          to_port                  = 443
          type                     = "ingress"
        },
        cluster_inbound = {
          description              = "Allow worker nodes to communicate with the cluster API Server"
          from_port                = 443
          protocol                 = "tcp"
          security_group_id        = "cluster_sg"
          source_security_group_id = "node_sg"
          to_port                  = 443
          type                     = "ingress"
        },
        cluster_outbound = {
          description              = "Allow cluster API Server to communicate with the worker nodes"
          from_port                = 1024
          protocol                 = "tcp"
          security_group_id        = "cluster_sg"
          source_security_group_id = "node_sg"
          to_port                  = 65535
          type                     = "egress"
        }
      }
      iam_roles = {
        eks_cluster_role = {
          iam_role_name = format("%s-cluster", var.eks_cluster_name)
          assume_role_policy = jsonencode({
            Statement = [{
              Action = "sts:AssumeRole"
              Effect = "Allow"
              Principal = {
                Service = "eks.amazonaws.com"
              }
            }]
            Version = "2012-10-17"
          })
        },
        eks_node_group_role = {
          iam_role_name = format("%s-worker", var.eks_cluster_name)
          assume_role_policy = jsonencode({
            Statement = [{
              Action = "sts:AssumeRole"
              Effect = "Allow"
              Principal = {
                Service = "ec2.amazonaws.com"
              }
            }]
            Version = "2012-10-17"
          })
        }
      }
      iam_role_policy_attachments = {
        eks_cluster_role = [
          "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
          "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
        ],
        eks_node_group_role = [
          "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
          "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
          "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        ]
      }
      eks_cluster = {
        eks_cluster_name        = var.eks_cluster_name
        cluster_version         = "1.25"
        role_arn                = "eks_cluster_role"
        security_group_ids      = ["node_sg", "cluster_sg"]
        endpoint_private_access = true
        endpoint_public_access  = false
      }
      iam_openid_connect_provider = {
        client_id_list  = ["sts.amazonaws.com"]
        thumbprint_list = []
      }
      eks_node_group = {
      eks_node_group_initial = {
        node_group_name = format("%s-node-group", var.eks_cluster_name)
        node_role_arn   = "eks_node_group_role"
        private_subnet  = true
        public_subnet   = false
        ami_type        = "AL2_x86_64"
        disk_size       = 50
        instance_types  = ["t3a.medium"]
        desired_size    = 3
        max_size        = 4
        min_size        = 3
        tags            = format("%s-node-group", var.eks_cluster_name)
      }
//      eks_node_group_gpu = {
//        node_group_name = format("%s-node-group-gpu", var.eks_cluster_name)
//        node_role_arn   = "eks_                        node_group_role"
//        private_subnet  = true
//        public_subnet   = false
//        ami_type        = "AL2_x86_64"
//        disk_size       = 20
//        instance_types  = ["g4dn.xlarge"]
//        desired_size    = 1
//        max_size        = 4
//        min_size        = 1
//        tags            = format("%s-node-group", var.eks_cluster_name)
//      }
     }
    }

  }
}

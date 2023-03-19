locals {
  variables = {
    default = {
      # eks_cluster_name = "eks_module_cluster"
      virtual-machine = {
        ami                         = "ami-0d81306eddc614a45"
        instance_type               = "t3a.medium"
        associate_public_ip_address = true
        key_name                    = "dotsolvedkey"
        Name                        = "bastion-instance-Dotsolved"
        subnet_id                   = "bastion_subnet"
        security_group_id           = "public_sg"
        template_file               = "../template/setup-terraform.sh"
      }
      vpc = {
        cidr_block           = "10.11.0.0/16"
        enable_dns_support   = true
        enable_dns_hostnames = true
        tags = {
          Name                                                     = format("%s-vpc", var.eks_cluster_name)
          format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
        }
      }
      subnet = {
        bastion_subnet = {
          cidr_block              = "10.11.4.0/24"
          availability_zone       = "ap-south-1a"
          map_public_ip_on_launch = true
          tags = {
            Name                                                     = "Custom Kubernetes cluster bastion subnet"
            format("kubernetes.io/cluster/%s", var.eks_cluster_name) = "shared"
            "kubernetes.io/role/internal-elb"                        = 1
          }
        },
      }
      internet_gateway = {
        tags = {
          Name = "eks_module-dev"
        }
      }
      route_table = {
        cidr_block = "0.0.0.0/0"
        tags = {
          Name = "eks_module-dev"
        }
      }
      security_group = {
        public_sg = {
          sg_name = "public-dev"
          tags = {
            Name = "public-sg-dev"
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
        }
      }
    }
  }
}

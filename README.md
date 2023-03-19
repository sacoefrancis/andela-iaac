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

commands:
1.terraform init

terraform init does is validate and configure the configuration’s backend if present. If that backend changes, then you’ll have to run terraform init again before doing other terraform commands like plan or apply.

terraform init also looks for module blocks in the configuration in the directory and then tracks down the source code for these modules based on arguments provided in source in the configuration. This builds out the module tree.

terraform init finds and downloads those providers from either the public Terraform Registry or a third-party provider registry.In fact, this is the part that generates the .terraform.lock.hcl


2.terraform plan

The terraform plan command is used to create an execution plan. The plan will be used to see all the resources that are getting created/updated/deleted, before getting applied

3.terraform apply

The Terraform “apply” command is used to apply changes in the configuration. You’ll notice that the “apply” command shows you the same “plan” output and asks you to confirm if you want to proceed with this plan.

The “-auto-approve” parameter will skip the confirmation for creating resources.

![image](https://user-images.githubusercontent.com/20705864/226191959-1a9b21b3-1fce-4c54-afd0-d83397a16db5.png)

Step 1:
create bastion isnatnce (jump host) machine with vpc and required subnets and services needed
/home/fjohn/andela-iaac/aws_vpc_bastion/terraform terraform init
/home/fjohn/andela-iaac/aws_vpc_bastion/terraform terraform apply

Step 2: 
Move  folder modules, aws_eks_cluster, aws_rds to bastion instance from where we will be creation rest of aws components
scp -pr  -i "andela.pem" /home/fjohn/Desktop/andela/aws_rds  ec2-user@ec2-0.0.0..ap-south-1.compute.amazonaws.com:/home/ec2-user/terraformscripts

Step 3:
Add aws confdiguration details in bastion instance 
aws configure
AWS Access Key ID [****************]: 
AWS Secret Access Key [****************]: 
Default region name [ap-souh-1]: 

step 4:
Now we can board aws eks clsuter
/home/fjohn/andela-iaac/aws_eks_cluster/terraform
we have env_specific_vars.tf modify the file according to the need

Step 5: 
Finally cluster is up 

variable "ami" {
  type        = string
  description = "(Required) ID of AMI to use for the instance"
}
variable "instance_type" {
  type        = string
  description = " (Required) The type of instance to start."
}

variable "key_name" {
  type        = string
  description = " (Optional) The key name to use for the instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = " (Optional) If true, the EC2 instance will have associated public IP address"
}

variable "subnet_id" {
  type        = string
  description = " (Optional) The VPC Subnet ID to launch in"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "Name" {
  type        = string
  description = " (Optional) Name for the instance"
}

variable "user_data" {
  description = "template file to run initial setup"
}

module "instance" {
  source                      = "../../modules/ec2_instance"
  ami                         = local.variables[terraform.workspace].virtual-machine.ami
  instance_type               = local.variables[terraform.workspace].virtual-machine.instance_type
  associate_public_ip_address = local.variables[terraform.workspace].virtual-machine.associate_public_ip_address
  subnet_id                   = module.subnet[local.variables[terraform.workspace].virtual-machine.subnet_id].id
  vpc_security_group_ids      = [module.security_group[local.variables[terraform.workspace].virtual-machine.security_group_id].id]
  key_name                    = local.variables[terraform.workspace].virtual-machine.key_name
  Name                        = local.variables[terraform.workspace].virtual-machine.Name
  user_data                   = file(local.variables[terraform.workspace].virtual-machine.template_file)
}


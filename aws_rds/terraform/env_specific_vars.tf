locals {
  variables = {
    default = {
      vpc = {
        vpc_id = "vpc-0fa83c1085e503552"
      }
    subnet = {
        private_subnet1 = {
          cidr_block              = "10.11.5.0/24"
          availability_zone       = "ap-south-1a"
          map_public_ip_on_launch = false
          tags = {
            Name                        = "rds private subnet-1"
          }
        },
        private_subnet2 = {
          cidr_block              = "10.11.6.0/24"
          availability_zone       = "ap-south-1b"
          map_public_ip_on_launch = false
          tags = {
            Name         = "rds private subnet-2"
          }
        }
      }
      db_subnet_group ={
        db_subnet_group_name  = "dbsubnet"
                tags = {
          Name = "dbsubnet"
        }
      }
	security_group = {
      		security_group_name = "rdsnsg"
      		egress_from_port = 0
      		egress_to_port = 0
     	 	egress_protocol = "-1"
     	 	egress_cidr_blocks = ["0.0.0.0/0"]
     	 	ingress_from_port = 3306
     	 	ingress_to_port = 3306
     	 	ingress_protocol = "tcp"
     	 	ingress_cidr_blocks = ["0.0.0.0/0"]
          }
                          
	db_instance ={
    		instance_class ="db.t2.micro"
    		engine = "mysql"
    		engine_version = "8.0.23"
    		multi_az = false
    		storage_type = "gp2"
    		allocated_storage = 20
    		name = "andela_dev_db"
   		    username = "admin"
   		    password = "z42a0OB7Xuwyvlpy"
    		apply_immediately = true
    		backup_retention_period = 0
    		#backup_window = "09:46-10:16"
    		identifier = "andela-rds-devdb"
    		skip_final_snapshot = true
        }
    }
  }
}

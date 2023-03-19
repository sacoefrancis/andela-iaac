variable "instance_class" {
  description = "(Required) The instance type of the RDS instance."
}

variable "engine" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide."
}

variable "engine_version" {
  description = " (Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10). The actual engine version used is returned in the attribute engine_version_actual, defined below. For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version'."
}

variable "multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
}

variable "storage_type" {
  description = "(Optional) One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not."
}

variable "allocated_storage" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
}

variable "name" {
  description = "(Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. If you are providing an Oracle db name, it needs to be in all upper case."
}

variable "username" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user."
}

variable "password" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information."
}

variable "backup_retention_period" {
  description = "describe your variable"
}

variable "db_subnet_group_name" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. See Read Replica."
}

variable "vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate."
}

# variable "backup_window" {
#   description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window."
# }

 variable "identifier" {
   description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
 }

variable "skip_final_snapshot" {
  description = " (Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica."
 }
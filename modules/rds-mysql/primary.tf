module "primary" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5"

  identifier = "${var.db_name}-primary"

  network_type = "DUAL"

  engine               = "mysql"
  engine_version       = var.engine_version
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = var.instance_class

  allocated_storage = var.allocated_storage
  storage_encrypted = var.storage_encrypted
  storage_type      = "gp3"

  username               = var.username
  password               = aws_ssm_parameter.database_password_parameter.value
  create_random_password = false

  port = 3306

  multi_az               = var.multi_az
  subnet_ids             = data.aws_subnets.private.ids
  vpc_security_group_ids = [var.rds_sg_id]

  maintenance_window              = "Mon:01:30-Mon:02:30"
  backup_window                   = "00:00-01:00"
  enabled_cloudwatch_logs_exports = []

  backup_retention_period = 7
  copy_tags_to_snapshot   = true

  skip_final_snapshot = true
  deletion_protection = true

  create_monitoring_role = true
  monitoring_role_name   = "${var.db_name}-monitoring-role"
  monitoring_interval    = 60

  create_db_subnet_group    = true
  create_db_option_group    = true
  create_db_parameter_group = true

  parameters = [
    {
      name  = "binlog_format"
      value = "ROW"
    },
    {
      name  = "log_output"
      value = "file"
    },
    {
      apply_method = "immediate"
      name         = "time_zone"
      value        = "Europe/Amsterdam"
    }
  ]

  db_instance_tags = {
    "Application" = var.db_name
  }
}

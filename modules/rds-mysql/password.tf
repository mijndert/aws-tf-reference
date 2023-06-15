resource "random_password" "database_password" {
  length  = 20
  special = false
}

resource "aws_ssm_parameter" "database_password_parameter" {
  name        = "/${var.environment}/rds-mysql8/password/${var.db_name}"
  description = "Database password for ${var.db_name}"
  type        = "SecureString"
  value       = random_password.database_password.result
}

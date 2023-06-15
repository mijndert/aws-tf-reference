module "rds-mysql8-application" {
  source = "../../../../modules/rds-mysql/"

  allocated_storage = "250"
  db_name           = "rds-db-example"
  engine_version    = "8.0.28"
  environment       = "example"
  instance_class    = "db.t3.small"
  multi_az          = false
  storage_encrypted = true
  username          = "admin"
  
  vpc_id            = var.vpc_id
  rds_sg_id         = var.rds_sg_id
}

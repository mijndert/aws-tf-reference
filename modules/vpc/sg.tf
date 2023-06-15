module "admin_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "admin-sg"
  description = "Admin Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "Allow SSH"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  tags = {
    Name = "admin-sg"
  }
}

module "rds_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "rds-mysql-sg"
  description = "RDS mysql Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "Allow MySQL to RDS"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  tags = {
    Name = "rds-mysql-sg"
  }
}
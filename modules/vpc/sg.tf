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
      cidr_blocks = module.vpc.vpc_cidr
    }
  ]

  tags = {
    Name = "admin-sg"
  }
}

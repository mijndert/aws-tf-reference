module "vpc" {
  source = "../../../../modules/vpc/"

  vpc_name = "example-vpc"
  vpc_cidr = "10.250.16.0/20"

  private_subnets  = ["10.250.16.0/24", "10.250.17.0/24", "10.250.18.0/24"]
  public_subnets   = ["10.250.19.0/24", "10.250.20.0/24", "10.250.21.0/24"]
  database_subnets = ["10.250.22.0/23", "10.250.24.0/23", "10.250.26.0/23"]

  environment = "example"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_sg_id" {
  value = module.vpc.rds_sg_id
}

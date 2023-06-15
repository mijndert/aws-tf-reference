module "account" { 
    source = "./account"
}

module "rds-mysql8-application" {
    source = "./rds-mysql"
    vpc_id = module.vpc.vpc_id
    rds_sg_id = module.vpc.rds_sg_id
}

module "vpc" { 
    source = "./vpc"
}
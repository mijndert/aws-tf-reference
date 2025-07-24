environment = "production"

state_bucket_name = "aws-tf-reference-terraform-state"

vpc_name           = "vpc-production"
vpc_cidr           = "10.0.0.0/16"
single_nat_gateway = true // set to true for cost reasons, has to be set to false for high availability

cluster_name           = "eks-production"
kubernetes_version     = "1.33"
endpoint_public_access = true

state_bucket_name = "example-deployment-terraform-state"

vpc_name           = "example-vpc-production"
vpc_cidr           = "10.0.0.0/16"
single_nat_gateway = true

cluster_name           = "example-eks-cluster-production"
kubernetes_version     = "1.33"
endpoint_public_access = true

// This Terraform code will create an EKS cluster using the Terraform AWS EKS module.
// The EKS cluster will be configured in a VPC and private subnets.
// The EKS cluster will operate using EKS Auto Mode and will have a node group for general workloads.

module "eks-cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  name                   = var.cluster_name
  kubernetes_version     = var.kubernetes_version
  endpoint_public_access = var.endpoint_public_access

  enable_cluster_creator_admin_permissions = true

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }
}

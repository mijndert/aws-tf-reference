module "eks-cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.3.1"

  cluster_name                   = var.eks_cluster_name
  cluster_version                = var.eks_cluster_version
  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}

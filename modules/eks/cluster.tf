module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = "1.26"

  enable_irsa = true

  cluster_endpoint_public_access = true

  vpc_id     = var.vpc_id
  subnet_ids = data.aws_subnets.private.ids

  create_cni_ipv6_iam_policy = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    initial = {
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 5
      desired_size = 1
    }
  }
}

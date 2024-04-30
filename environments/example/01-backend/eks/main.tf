module "eks" {
  source = "../../../../modules/eks/"

  environment     = "example"
  cluster_name    = "example-eks-backend"
  cluster_version = "1.29"
}

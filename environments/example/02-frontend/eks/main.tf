module "eks" {
  source = "../../../../modules/eks/"

  environment  = "example"
  cluster_name = "example-eks-frontend"
}

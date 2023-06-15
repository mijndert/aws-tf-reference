module "ecr" {
  source = "../../../../modules/ecr"

  ecr_repositories = [
    "backend-application"
  ]
}

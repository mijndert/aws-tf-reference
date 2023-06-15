module "ecr" {
  source = "../../../../modules/ecr"

  ecr_repositories = [
    "frontend-application"
  ]
}

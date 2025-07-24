terraform {
  backend "s3" {
    use_lockfile = true
    bucket       = var.state_bucket_name
    key          = "${var.environment}/terraform.tfstate"
    region       = "eu-central-1"
  }
}

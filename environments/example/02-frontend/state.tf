terraform {
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = "terraform-state-example-accountid-region"
    encrypt        = true
    key            = "02-frontend.tfstate"
    region         = "eu-west-1"
  }
}

terraform {
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = "terraform-state-example-accountid-region"
    encrypt        = true
    key            = "00-shared.tfstate"
    region         = "eu-west-1"
  }
}

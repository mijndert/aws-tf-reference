terraform {
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = "terraform-state-mijndert"
    encrypt        = true
    key            = "01-account.tfstate"
    region         = "eu-west-1"
  }
}

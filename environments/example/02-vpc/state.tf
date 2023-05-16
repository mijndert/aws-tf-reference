terraform {
  backend "s3" {
    dynamodb_table = "terraform-locks"
    bucket         = "terraform-state-mijndert"
    encrypt        = true
    key            = "02-vpc.tfstate"
    region         = "eu-west-1"
  }
}

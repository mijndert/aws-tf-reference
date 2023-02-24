provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      terraform   = "managed"
      owner       = "devops"
      environment = "example"
    }
  }
}

variable "environment" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "private_subnets" {
  type = list(string)
}
variable "public_subnets" {
  type = list(string)
}
variable "database_subnets" {
  type = list(string)
}
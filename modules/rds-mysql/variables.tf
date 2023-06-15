variable "environment" {}

variable "db_name" {}

variable "engine_version" {}

variable "instance_class" {
  default = ""
  type    = string
}

variable "allocated_storage" {}

variable "storage_encrypted" {
  type = bool
}

variable "username" {}

variable "multi_az" {
  type = bool
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC for this RDS"
}

variable "rds_sg_id" {
  type        = string
  description = "The ID of the Security Group for this RDS"
}
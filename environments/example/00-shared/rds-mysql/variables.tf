variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "rds_sg_id" {
  type        = string
  description = "The ID of the Security Group for RDS"
}

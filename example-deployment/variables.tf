variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "single_nat_gateway" {
  description = "Set to true to provision a single NAT Gateway in the public subnet"
  default     = false
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster to provision"
}

variable "eks_cluster_version" {
  description = "Version of the EKS cluster to provision"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for the Terraform statefile"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "single_nat_gateway" {
  description = "Set to true to provision a single NAT Gateway in the public subnet"
  default     = false
}

variable "cluster_name" {
  description = "Name of the EKS cluster to provision"
  default     = "example-eks-cluster"
}

variable "kubernetes_version" {
  description = "Version of the EKS cluster to provision"
  default     = "1.33"
}

variable "endpoint_public_access" {
  description = "Set to true to allow public access to the EKS cluster endpoint"
  default     = true
}

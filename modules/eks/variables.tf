variable "environment" {
  type        = string
  description = "The environment to deploy to"
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for the EKS cluster"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

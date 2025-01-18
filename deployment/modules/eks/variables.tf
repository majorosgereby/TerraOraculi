variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}


variable "availability_zones" {
  description = "List of availability zones for the EKS subnets."
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

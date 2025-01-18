variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "practice/express-example" # Optional default value
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-2" # Optional default value
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

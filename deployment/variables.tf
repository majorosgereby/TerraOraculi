variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  type        = string
  default     = "practice/express-example"
}

variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "my-eks-cluster"
}

variable "image_name" {
  description = "The name of the docker image to push."
  type        = string
  default     = "express-example"
}

variable "image_version_tag" {
  description = "The version tag of the docker iamge"
  type        = string
  default     = "latest"
}

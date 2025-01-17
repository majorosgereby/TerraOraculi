variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

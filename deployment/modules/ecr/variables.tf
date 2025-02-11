variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

variable "image_name" {
  description = "The name of the docker image to push."
  type        = string
  default     = "express-example"
}

variable "image_version_tag" {
  description = "The version tag of the docker image to push to ECR."
  type        = string
  default     = "latest"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "express_image_repo" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "null_resource" "docker_push" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin $(aws ecr describe-repositories --repository-names ${var.ecr_repository_name} --region ${var.aws_region} | jq -r '.repositories[0].repositoryUri')
      docker tag express-example:latest $(aws ecr describe-repositories --repository-names ${var.ecr_repository_name} --region ${var.aws_region} | jq -r '.repositories[0].repositoryUri'):latest
      docker push $(aws ecr describe-repositories --repository-names ${var.ecr_repository_name} --region ${var.aws_region} | jq -r '.repositories[0].repositoryUri'):latest
    EOT
  }

  depends_on = [aws_ecr_repository.express_image_repo]
}

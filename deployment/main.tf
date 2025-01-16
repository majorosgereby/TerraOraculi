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
  region = "eu-west-2"
}

# ECR for storing the docker image
resource "aws_ecr_repository" "express_image_repo" {
  name                 = "practice/express-example"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}

# pushing the docker image into the container
resource "null_resource" "docker_push" {
  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin $(aws ecr describe-repositories --repository-names practice/express-example --region eu-west-2 | jq -r '.repositories[0].repositoryUri')
      docker tag express-example:latest $(aws ecr describe-repositories --repository-names practice/express-example --region eu-west-2 | jq -r '.repositories[0].repositoryUri'):latest
      docker push $(aws ecr describe-repositories --repository-names practice/express-example --region eu-west-2 | jq -r '.repositories[0].repositoryUri'):latest
    EOT
  }

  depends_on = [aws_ecr_repository.express_image_repo]
}

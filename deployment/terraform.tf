terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   version = "~> 4.16"
      version = "~> 5.47.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

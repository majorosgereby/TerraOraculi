terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   version = "~> 4.16"
      version = "~> 5.47.0"
    }
  }

  required_version = ">= 1.2.0"
}

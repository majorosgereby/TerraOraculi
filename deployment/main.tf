provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source              = "./modules/ecr"
  aws_region          = var.aws_region
  ecr_repository_name = var.ecr_repository_name
}

data "aws_availability_zones" "available" {}

module "eks" {
  source             = "./modules/eks"
  aws_region         = var.aws_region
  availability_zones = data.aws_availability_zones.available.names
  cluster_name       = var.cluster_name
  desired_size       = 3
  max_size           = 6
  min_size           = 2
  instance_types     = ["t2.micro"]
  disk_size          = 20
}

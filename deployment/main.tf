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

module "kubernetes" {
  source = "./modules/kubernetes"

  # Kubernetes cluster details
  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint

  # ECR Image details
  ecr_repository = module.ecr.repository_url
  image_tag      = var.image_tag

  # Application details
  namespace      = "default"
  replica_count  = 2
  container_port = 8128
  service_type   = "LoadBalancer"

}

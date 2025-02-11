provider "aws" {
  region = var.aws_region
}

# Pushing the image to ECR
module "ecr" {
  source              = "./modules/ecr"
  aws_region          = var.aws_region
  ecr_repository_name = var.ecr_repository_name
  image_name          = var.image_name
  image_version_tag   = var.image_version_tag
}

# Provision the EKS cluster
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

# Managing the kubernetes cluster
module "kubernetes" {
  source = "./modules/kubernetes"

  # Kubernetes cluster details
  cluster_name           = module.eks.cluster_name
  cluster_endpoint       = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_ca_certificate
  cluster_token          = data.aws_eks_cluster_auth.cluster.token

  # ECR Image details
  ecr_repository    = module.ecr.repository_url
  image_version_tag = var.image_version_tag

  # Application details
  namespace      = var.application_namespace
  replica_count  = 2
  container_port = 8128
  service_type   = "ClusterIP"

}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

# provider "kubernetes" {
#   host = var.cluster_endpoint
#   # cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1"
#     args        = ["eks", "update-kubeconfig", "--region", "eu-west-2", "--name", var.cluster_name]
#     command     = "aws"
#   }
# }

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1"
    args        = ["eks", "update-kubeconfig", "--region", "eu-west-2", "--name", var.cluster_name]
    command     = "aws"
  }
}

data "aws_eks_cluster" "cluster" {
  name       = var.cluster_name
  depends_on = [var.cluster_name]
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.aws_eks_cluster.cluster.name
}

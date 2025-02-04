provider "kubernetes" {
  host = var.cluster_endpoint
  # cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1"
    args        = ["eks", "update-kubeconfig", "--region", "eu-west-2", "--name", var.cluster_name]
    command     = "aws"
  }
}

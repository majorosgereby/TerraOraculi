variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "my-eks-cluster"
}

variable "namespace" {
  description = "Namespace for the deployment"
  type        = string
  default     = "default"
}

variable "ecr_repository" {
  description = "ECR repository URL"
  type        = string
}

variable "image_version_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "replica_count" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 2
}

variable "service_type" {
  description = "Kubernetes service type (LoadBalancer, ClusterIP, etc.)"
  type        = string
  default     = "LoadBalancer"
}

variable "container_port" {
  description = "Container port to expose"
  type        = number
  default     = 8080
}

variable "cluster_endpoint" {
  description = "The endpoint to the cluster"
  type        = string
}

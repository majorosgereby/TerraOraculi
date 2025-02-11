# Outputs for ECR
output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = module.ecr.repository_url
}

# Outputs for EKS
output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "The endpoint URL for the EKS cluster API server."
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the EKS cluster."
  value       = module.eks.cluster_arn
}

output "eks_cluster_security_group_id" {
  description = "The security group ID associated with the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "eks_vpc_id" {
  description = "The ID of the VPC created for the EKS cluster."
  value       = module.eks.vpc_id
}

output "eks_subnet_ids" {
  description = "The IDs of the subnets created for the EKS cluster."
  value       = module.eks.subnet_ids
}

# Kubernetes outputs
# output "load_balancer_name" {
#   description = "The name of the load balancer of the application."
#   value       = module.kubernetes.load_balancer_name
# }

output "load_balancer_hostname" {
  description = "The host name of the load balancer that makes the application visible."
  value       = module.kubernetes.load_balancer_hostname
}

# output "load_balancer_ip" {
#   description = "The ip address of the load balancer, the entry point of the application."
#   value       = module.kubernetes.load_balancer_ip
# }

# MISC outputs
output "region" {
  description = "The amazon region declared in variables."
  value       = var.aws_region
}


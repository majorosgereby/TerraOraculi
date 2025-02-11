output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "The endpoint URL for the EKS cluster API server."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_ca_certificate" {
  description = "The certificate for authenticating the kubernetes cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

# output "cluster_token" {
#   description = "The authentication token for the cluster."
#   value       = data.aws_eks_cluster_auth.cluster.token
#   sensitive   = true
# }

output "cluster_security_group_id" {
  description = "The security group ID associated with the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "vpc_id" {
  description = "The ID of the VPC created for the EKS cluster."
  value       = aws_vpc.eks_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the subnets created for the EKS cluster."
  value       = aws_subnet.eks_subnet[*].id
}

output "node_group_name" {
  description = "Name of the EKS node group."
  value       = aws_eks_node_group.eks_node_group.node_group_name
}

output "node_group_arn" {
  description = "ARN of the EKS node group."
  value       = aws_eks_node_group.eks_node_group.arn
}

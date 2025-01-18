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

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.eks_subnet[*].id

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types
  disk_size      = var.disk_size

  tags = {
    Name = "eks-node-group-${var.node_group_name}"
  }

  depends_on = [aws_iam_role_policy_attachment.eks_node_policy_attach,
    aws_iam_role_policy_attachment.eks_cni_policy_attach,
    aws_iam_role_policy_attachment.cloudwatch_policy_attach,
    aws_iam_role_policy_attachment.ec2_container_registry_readonly,
  aws_eks_addon.vpc_cni]
}

# addon for managing eks cluster
resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "vpc-cni"
  addon_version = "v1.19.2-eksbuild.1"
}

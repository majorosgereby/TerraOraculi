output "repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.express_image_repo.repository_url
}

output "ecr_repo_url" {
  value = aws_ecr_repository.ghost-ecr-repository.repository_url
}
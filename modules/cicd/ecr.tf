resource "aws_ecr_repository" "ghost-ecr-repository" {
  name                 = "ghost-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

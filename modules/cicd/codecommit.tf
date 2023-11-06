resource "aws_codecommit_repository" "ghost-repo" {
  repository_name = "ghost-app-repository"
  description     = "Repository that will contain the source code of the Ghost App"
}

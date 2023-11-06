resource "aws_codepipeline" "my_pipeline" {
  name     = "my-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.pipeline_store.bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        BranchName     = "main"
        RepositoryName = aws_codecommit_repository.ghost-repo.repository_name
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.my_codebuild_project.name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      version         = "1"
      input_artifacts = ["build_output"] # This should match the name of the output artifact from your build stage

      configuration = {
        ApplicationName     = aws_codedeploy_app.ghost-app.name
        DeploymentGroupName = aws_codedeploy_deployment_group.ghost-app-dep_group.deployment_group_name
      }
    }
  }
}

# S3 bucket for storing pipeline artifacts
resource "aws_s3_bucket" "pipeline_store" {
  bucket = "ghost-pipeline-artifacts-bucket-2023-11-05t22-10-52-00-00" 
}

resource "aws_s3_bucket_versioning" "pipeline_store_versioning" {
  bucket = aws_s3_bucket.pipeline_store.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_codedeploy_app" "ghost-app" {
  name             = "ghost-app"
  compute_platform = "ECS"
}

resource "aws_codedeploy_deployment_group" "ghost-app-dep_group" {
  app_name              = aws_codedeploy_app.ghost-app.name
  deployment_group_name = "my-dep-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = var.ecs_service_name
  }
}

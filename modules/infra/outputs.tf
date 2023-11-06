output "ecs_cluster_name" {
  value = aws_ecs_cluster.ghost-cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.ghost-ecs-serivce.name
}
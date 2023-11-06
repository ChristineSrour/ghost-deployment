variable "ecs_cluster_name" {
  type        = string
  description = "name of the ecs cluster to deploy to"
}

variable "ecs_service_name" {
  type    = string
  default = "name of the ecs service to deploy to"
}
terraform {
  backend "s3" {
    bucket = "ghost-terraform-bucket-6-11-2023-01-12"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}


module "infra" {
  source       = "./modules/infra"
  ecr-repo-url = module.cicd.ecr_repo_url
}

module "cicd" {
  source           = "./modules/cicd"
  ecs_cluster_name = module.infra.ecs_cluster_name
  ecs_service_name = module.infra.ecs_service_name
}
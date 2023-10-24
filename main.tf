module "ecs" {
  source = "./ecs"
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
}

module "iam" {
  source = "./iam"
}

module "network" {
  source = "./network"
}

module "ecr" {
  source = "./ecr"
}
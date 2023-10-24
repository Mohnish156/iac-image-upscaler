resource "aws_ecs_cluster" "cluster" {
  name = "image-upscaler-cluster"
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = "fastapi-task"
  container_definitions    = file("${path.module}/../container-definitions/container-definition.json")
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.ecs_task_execution_role_arn
}


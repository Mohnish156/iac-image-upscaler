resource "aws_ecs_cluster" "cluster" {
  name = "image-upscaler-cluster"
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = "image-upscaler-task"
  container_definitions    = file("${path.module}/../container-definitions/container-definition.json")
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.ecs_task_execution_role_arn
}

resource "aws_ecs_service" "image_upscaler_service" {
  name            = "image-upscaler-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 1
  launch_type     = "EC2"
}


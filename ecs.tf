resource "aws_ecs_task_definition" "my_task" {
  family                   = var.ecs_task_family
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = aws_iam_role.upscaler_task_execution_role.arn

  container_definitions    = file("${path.module}/container-definitions/container-definition.json")
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "image_upscaler_cluster"
}



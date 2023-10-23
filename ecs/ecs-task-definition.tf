resource "aws_ecs_task_definition" "task_definition" {
  family                   = "fastapi-family"
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = <<DEFINITION
[
  {
    "name": "fastapi-container",
    "image": "${aws_ecr_repository.repository.repository_url}:latest",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "resourceRequirements": [
      {
        "type": "GPU",
        "value": "1"
      }
    ],
    "portMappings": [
      {
        "containerPort": 8000,
        "hostPort": 8000
      }
    ]
  }
]
DEFINITION
}

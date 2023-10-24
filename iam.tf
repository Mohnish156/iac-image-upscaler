// iam.tf

// IAM Role for ECS Task Execution
resource "aws_iam_role" "upscaler_task_execution_role" {
  name = "upscaler_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "upscaler_task_execution_policy" {
  role       = aws_iam_role.upscaler_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

// IAM Role for EC2 Instance
resource "aws_iam_role" "upscaler_instance_role" {
  name = "upscaler_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "upscaler_instance_policy" {
  role       = aws_iam_role.upscaler_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "upscaler_instance_profile" {
  name = "upscaler_instance_profile"
  role = aws_iam_role.upscaler_instance_role.name
}

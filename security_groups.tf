resource "aws_security_group" "ecs_tasks_sg" {
  vpc_id = aws_vpc.upscaler_vpc.id
  name   = "ecs_tasks_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For HTTP. Adjust based on your security requirements.
  }

  # Add more rules if needed
}

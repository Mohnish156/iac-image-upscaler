resource "aws_launch_configuration" "ecs" {
  name_prefix                 = "img-upscaler"
  image_id                    = "ami-0efcece6bed30fd98"
  instance_type               = "g4dn.xlarge"
  iam_instance_profile        = aws_iam_instance_profile.ecs_instance_profile.name

  # Ensure the EC2 instance registers with the ECS Cluster
  user_data = <<-EOF
              #!/bin/bash
              echo "ECS_CLUSTER=${aws_ecs_cluster.my_cluster.name}" >> /etc/ecs/ecs.config
              EOF

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "ecs" {
  launch_configuration = aws_launch_configuration.ecs.name
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1

  # Define which VPC and subnet to launch the instance into.
  vpc_zone_identifier  = [aws_subnet.upscaler_subnet.id] # Change this to your subnet ID

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = aws_iam_role.ecs_instance.name
}

resource "aws_iam_role" "ecs_instance" {
  name = "ecs-instance-role"

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

resource "aws_iam_role_policy_attachment" "ecs_instance" {
  role       = aws_iam_role.ecs_instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}





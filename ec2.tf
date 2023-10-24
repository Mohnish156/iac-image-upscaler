// Append to ec2.tf

resource "aws_instance" "upscaler_instance" {
  ami             = "ami-0efcece6bed30fd98"  // Replace with ECS-optimized AMI ID
  instance_type   = "g4dn.xlarge"
  subnet_id       = aws_subnet.upscaler_subnet.id
  vpc_security_group_ids = [aws_security_group.upscaler_sg.id]
  iam_instance_profile = aws_iam_instance_profile.upscaler_instance_profile.name

  user_data = <<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=image_upscaler_cluster >> /etc/ecs/ecs.config
              EOF

  tags = {
    Name = "ECS Instance - Image Upscaler"
  }
}

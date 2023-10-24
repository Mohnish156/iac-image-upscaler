resource "aws_instance" "ecs_instance" {
  ami                    = "ami-03f65b8614a860c29"
  instance_type          = "g4dn.xlarge"
  iam_instance_profile   = aws_iam_instance_profile.ecs_instance_profile.name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.subnet.id

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.image_upscaler_cluster.name} >> /etc/ecs/ecs.config
EOF

  tags = {
    Name = "ECS Instance - Image Upscaler"
  }
}
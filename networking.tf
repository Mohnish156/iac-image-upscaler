// networking.tf

resource "aws_vpc" "upscaler_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "upscaler_vpc"
  }
}

resource "aws_subnet" "upscaler_subnet" {
  vpc_id     = aws_vpc.upscaler_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "upscaler_subnet"
  }
}

resource "aws_security_group" "upscaler_sg" {
  vpc_id = aws_vpc.upscaler_vpc.id
  tags = {
    Name = "upscaler_sg"
  }

  // Here you can define ingress/egress rules, e.g.:
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  // Warning: This allows all traffic, so you might want to restrict it
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

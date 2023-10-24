resource "aws_ecr_repository" "repository" {
  name                 = "image-upscaler-repository"  # Name of the ECR repository
  image_tag_mutability = "MUTABLE"            # Or use "IMMUTABLE" as needed
  image_scanning_configuration {
    scan_on_push = true
  }
}
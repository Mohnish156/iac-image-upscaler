resource "aws_ecr_repository" "upscaler_repository" {
  name                 = "image-upscaler-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

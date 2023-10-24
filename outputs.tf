output "ecs_service_url" {
  description = "URL for the deployed ECS service"
  value       = "http://${aws_instance.upscaler_instance.public_ip}"
}
variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type for the ECS tasks"
  default     = "g4dn.large"
}

variable "ecs_service_name" {
  description = "Name for the ECS service"
  default     = "image-upscaler-service"
}

variable "ecs_task_family" {
  description = "Task family for the ECS task definition"
  default     = "image-upscaler-task"
}

# Add more variables as required.

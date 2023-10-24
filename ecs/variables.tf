variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "image-upscaler-cluster"
}

variable "ecs_task_execution_role_arn" {
  description = "ARN of the IAM role for ECS task execution"
  type        = string
}
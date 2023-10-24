variable "iam_role_name" {
  description = "Name of the IAM role for ECS task execution"
  type        = string
  default     = "ecs_task_execution_role"
}

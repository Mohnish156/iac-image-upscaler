provider "aws" {
  region = "us-west-2"  # replace with your AWS region
}

module "ecs" {
  source = "./ecs"
}

module "ecr" {
  source = "./ecr"
}

module "iam" {
  source = "./iam"
}

module "vpc" {
  source = "./vpc"
}
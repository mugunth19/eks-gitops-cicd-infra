
terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source     = "./eks"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  admin_user_arn = var.admin_user_arn

}

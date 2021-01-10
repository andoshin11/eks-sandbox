variable "name" {}

variable "project" {}

variable "environment" {}

variable "aws_region" {}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "num_subnets" {
  default = 3
}

locals {
  base_tags = {
    Project     = var.project
    Terraform   = true
    Environment = var.environment
  }

  default_tags    = merge(local.base_tags, map("kubernetes.io/cluster/${local.cluster_name}", "shared"))
  base_name       = "${var.project}-${var.environment}"
  cluster_name    = "eks-sandbox-andy"
  cluster_version = "1.18"
}

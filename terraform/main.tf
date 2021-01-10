provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

terraform {
  backend "remote" {
    organization = "studio-andy"
    workspaces {
      name = "eks-sandbox"
    }
  }
}

module "base" {
  source      = "./modules"
  aws_region  = var.aws_region
  name        = var.name
  project     = var.project
  environment = var.environment
}

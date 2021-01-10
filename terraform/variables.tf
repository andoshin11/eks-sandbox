variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "name" {
  default = "eks-sandbox"
}

variable "project" {
  default = "eks-sandbox"
}

variable "environment" {
  default = "dev"
}

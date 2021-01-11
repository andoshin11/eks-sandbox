data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = merge(local.default_tags, map("Name", "${local.base_name}-vpc"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

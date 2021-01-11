# Public Subnet

resource "aws_subnet" "subnet-public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 1)
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-a"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_subnet" "subnet-public-c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 3)
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-c"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_subnet" "subnet-public-d" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 2)
  availability_zone       = "${var.aws_region}d"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-d"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# Private Subnet

resource "aws_subnet" "subnet-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 10)
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-a"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_subnet" "subnet-private-c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 30)
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-c"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "aws_subnet" "subnet-private-d" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 20)
  availability_zone       = "${var.aws_region}d"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-d"))

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

# Public Subnet

resource "aws_subnet" "subnet-public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 1)
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-a"))
}

resource "aws_subnet" "subnet-public-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 2)
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-b"))
}

resource "aws_subnet" "subnet-public-c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 3)
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-public-c"))
}

# Private Subnet

resource "aws_subnet" "subnet-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 10)
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-a"))
}

resource "aws_subnet" "subnet-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 20)
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-b"))
}

resource "aws_subnet" "subnet-private-c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 30)
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-subnet-private-c"))
}

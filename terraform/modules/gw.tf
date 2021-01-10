resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, map("Name", "${local.base_name}-main"))
}

resource "aws_nat_gateway" "nat_1a" {
  subnet_id     = aws_subnet.subnet-public-a.id
  allocation_id = aws_eip.nat_1a.id

  depends_on = [aws_internet_gateway.igw]

  tags = merge(local.default_tags, map("Name", "${local.base_name}-1a"))
}

resource "aws_nat_gateway" "nat_1c" {
  subnet_id     = aws_subnet.subnet-public-c.id
  allocation_id = aws_eip.nat_1c.id

  depends_on = [aws_internet_gateway.igw]

  tags = merge(local.default_tags, map("Name", "${local.base_name}-1c"))
}

resource "aws_nat_gateway" "nat_1d" {
  subnet_id     = aws_subnet.subnet-public-d.id
  allocation_id = aws_eip.nat_1d.id

  depends_on = [aws_internet_gateway.igw]

  tags = merge(local.default_tags, map("Name", "${local.base_name}-1d"))
}

resource "aws_nat_gateway" "nat_1a" {
  subnet_id     = aws_subnet.subnet-public-a.id
  allocation_id = aws_eip.nat_1a.id


  tags = merge(local.default_tags, map("Name", "${local.base_name}-1a"))
}

resource "aws_nat_gateway" "nat_1b" {
  subnet_id     = aws_subnet.subnet-public-b.id
  allocation_id = aws_eip.nat_1b.id


  tags = merge(local.default_tags, map("Name", "${local.base_name}-1b"))
}

resource "aws_nat_gateway" "nat_1c" {
  subnet_id     = aws_subnet.subnet-public-c.id
  allocation_id = aws_eip.nat_1c.id


  tags = merge(local.default_tags, map("Name", "${local.base_name}-1c"))
}

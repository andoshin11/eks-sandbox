resource "aws_eip" "nat_1a" {
  vpc = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-natgw-1a"))
}

resource "aws_eip" "nat_1b" {
  vpc = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-natgw-1b"))
}

resource "aws_eip" "nat_1c" {
  vpc = true

  tags = merge(local.default_tags, map("Name", "${local.base_name}-natgw-1c"))
}

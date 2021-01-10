
# # resource "aws_route_table" "rtb" {
# #   vpc_id = aws_vpc.vpc.id

# #   route {
# #     cidr_block = "0.0.0.0/0"
# #     gateway_id = aws_internet_gateway.igw.id
# #   }

# #   tags = merge(local.default_tags, map("Name", "${local.base_name}-rtb"))
# # }

# # resource "aws_route_table_association" "rtba" {
# #   count          = var.num_subnets
# #   subnet_id      = element(aws_subnet.subnet.*.id, count.index)
# #   route_table_id = aws_route_table.rtb.id
# # }

# ####################
# ### Route Table ####
# ####################

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.vpc.id

#   tags = merge(local.default_tags, map("Name", "${local.base_name}-public"))
# }

# resource "aws_route_table" "private_1a" {
#   vpc_id = aws_vpc.vpc.id

#   tags = merge(local.default_tags, map("Name", "${local.base_name}-private-1a"))
# }

# resource "aws_route_table" "private_1c" {
#   vpc_id = aws_vpc.vpc.id

#   tags = merge(local.default_tags, map("Name", "${local.base_name}-private-1c"))
# }

# resource "aws_route_table" "private_1d" {
#   vpc_id = aws_vpc.vpc.id

#   tags = merge(local.default_tags, map("Name", "${local.base_name}-private-1d"))
# }

# ####################
# ###    Route    ####
# ####################

# resource "aws_route" "public" {
#   destination_cidr_block = "0.0.0.0/0"
#   route_table_id         = aws_route_table.public.id
#   gateway_id             = aws_internet_gateway.main.id
# }

# resource "aws_route" "private_1a" {
#   destination_cidr_block = "0.0.0.0/0"
#   route_table_id         = aws_route_table.private_1a.id
#   nat_gateway_id         = aws_nat_gateway.nat_1a.id
# }

# resource "aws_route" "private_1c" {
#   destination_cidr_block = "0.0.0.0/0"
#   route_table_id         = aws_route_table.private_1c.id
#   nat_gateway_id         = aws_nat_gateway.nat_1c.id
# }

# resource "aws_route" "private_1d" {
#   destination_cidr_block = "0.0.0.0/0"
#   route_table_id         = aws_route_table.private_1d.id
#   nat_gateway_id         = aws_nat_gateway.nat_1d.id
# }

# ####################################
# ###   Route Table Association   ####
# ####################################


# resource "aws_route_table_association" "public_1a" {
#   subnet_id      = aws_subnet.subnet-public-a.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public_1c" {
#   subnet_id      = aws_subnet.subnet-public-c.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public_1d" {
#   subnet_id      = aws_subnet.subnet-public-d.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private_1a" {
#   subnet_id      = aws_subnet.subnet-private-a.id
#   route_table_id = aws_route_table.private_1a.id
# }

# resource "aws_route_table_association" "private_1c" {
#   subnet_id      = aws_subnet.subnet-private-c.id
#   route_table_id = aws_route_table.private_1c.id
# }

# resource "aws_route_table_association" "private_1d" {
#   subnet_id      = aws_subnet.subnet-private-d.id
#   route_table_id = aws_route_table.private_1d.id
# }


# resource "aws_security_group" "cluster-master" {
#   name = "${var.name}-${terraform.workspace}-security-group-cluster-master"
#   description = "EKS cluster master security group"

#   tags = merge(local.default_tags,map("Name","${var.name}-${terraform.workspace}-security-group-cluster-master"))

#   vpc_id = aws_vpc.vpc.id

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "cluster-nodes" {
#   name        = "${var.name}-${terraform.workspace}-security-group-cluster-nodes"
#   description = "EKS cluster nodes security group"

#   tags   = merge(local.default_tags,map("Name","${var.name}-${terraform.workspace}-security-group-cluster-nodes"))
#   vpc_id = aws_vpc.vpc.id

#   ingress {
#     description = "Allow cluster master to access cluster nodes"
#     from_port   = 1025
#     to_port     = 65535
#     protocol    = "tcp"

#     security_groups = [aws_security_group.cluster-master.id]
#   }

#   ingress {
#     description = "Allow cluster master to access cluster nodes"
#     from_port   = 1025
#     to_port     = 65535
#     protocol    = "udp"

#     security_groups = [aws_security_group.cluster-master.id]
#   }

#   ingress {
#     description = "Allow inter pods communication"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     self        = true
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

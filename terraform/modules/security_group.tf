resource "aws_security_group" "eks-master" {
  name        = "${var.name}-${terraform.workspace}-security-group-eks-master"
  description = "EKS master security group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.default_tags,map("Name","${var.name}-${terraform.workspace}-security-group-eks-master"))
}

resource "aws_security_group" "eks-node" {
  name        = "${var.name}-${terraform.workspace}-security-group-eks-node"
  description = "EKS node security group"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description     = "Allow cluster master to access cluster node"
    from_port       = 1025
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.eks-master.id]
  }

  ingress {
    description     = "Allow cluster master to access cluster node"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.eks-master.id]
    self            = false
  }

  ingress {
    description = "Allow inter pods communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.default_tags,map("Name","${var.name}-${terraform.workspace}-security-group-eks-node"))
}

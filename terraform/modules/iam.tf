# resource "aws_iam_role" "eks-master-role" {
#   name = "eks-master-role"

#   assume_role_policy = <<EOS
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "eks.amazonaws.com"
#       },
#       "Effect": "Allow"
#     }
#   ]
# }
# EOS
# }

# resource "aws_iam_role_policy_attachment" "eks-cluster-policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks-master-role.name
# }

# resource "aws_iam_role_policy_attachment" "eks-service-policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
#   role       = aws_iam_role.eks-master-role.name
# }

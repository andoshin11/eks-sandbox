resource "aws_autoscaling_group" "eks-asg" {
  name                 = "EKS node autoscaling group"
  desired_capacity     = var.num_subnets
  launch_configuration = aws_launch_configuration.lc.id
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier = [
    aws_subnet.subnet-private-a.id,
    aws_subnet.subnet-private-c.id,
    aws_subnet.subnet-private-d.id,
  ]

  tags = merge(local.default_tags, map("Name", "${local.base_name}-eks-asg"))

  tag {
    key                 = "kubernetes.io/cluster/${local.cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

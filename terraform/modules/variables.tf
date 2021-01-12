variable "name" {}

variable "project" {}

variable "environment" {}

variable "aws_region" {}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "num_subnets" {
  default = 3
}

variable "instance_type" {
  default = "t2.small"
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 3
}

variable "key_name" {
  default = "KEY"
}

locals {
  base_tags = {
    Project     = var.project
    Terraform   = true
    Environment = var.environment
  }

  default_tags    = merge(local.base_tags, map("kubernetes.io/cluster/${local.cluster_name}", "shared"))
  base_name       = "${var.project}-${var.environment}"
  cluster_name    = "eks-sandbox-andy"
  cluster_version = "1.18"

  userdata = <<EOS
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint "${aws_eks_cluster.cluster.endpoint}" --b64-cluster-ca "${aws_eks_cluster.cluster.certificate_authority.0.data}" "${aws_eks_cluster.cluster.name}"
EOS

  kubeconfig = <<EOS
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.cluster.certificate_authority.0.data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${local.cluster_name}"
EOS

  eks_configmap = <<EOS
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.eks-node.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
EOS
}

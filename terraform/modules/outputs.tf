output "kubectl config" {
  value = local.kubeconfig
}

output "EKS ConfigMap" {
  value = local.eks_configmap
}

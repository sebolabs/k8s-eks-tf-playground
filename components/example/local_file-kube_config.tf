resource "local_file" "kube_config" {
  content  = module.eks_cluster.kube_config
  filename = "/tmp/kubeconfig_${module.eks_cluster.cluster.id}"
}

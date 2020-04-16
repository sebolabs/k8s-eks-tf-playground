data "template_file" "k8s_aws_auth_configmap_maproles" {
  template = file("${path.module}/templates/k8s/aws_auth-configmap-mapRoles.yaml")

  vars = {
    eks_cluster_provisioner_iam_role_arn = module.eks_cluster.cluster_provsioner_iam_role_arn
    eks_nodes_iam_role_arn               = module.eks_nodes_default.iam_role.arn
  }
}

data "template_file" "k8s_aws_auth_configmap_mapusers" {
  template = file("${path.module}/templates/k8s/aws_auth-configmap-mapUsers.yaml")

  vars = {
    iam_admin_users_arns = join(",", data.aws_iam_user.eks_cluster_admin_users.*.arn)
  }
}

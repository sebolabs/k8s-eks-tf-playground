data "template_file" "kube_config" {
  template = file("${path.module}/templates/kube_config.tpl")

  vars = {
    cluster_server            = aws_eks_cluster.main.endpoint
    cluster_ca_data           = aws_eks_cluster.main.certificate_authority.0.data
    cluster_name              = aws_eks_cluster.main.id
    provisioner_iam_role_arn  = aws_iam_role.cluster_provisioner.arn
    aws_region                = data.aws_region.current.name
  }
}

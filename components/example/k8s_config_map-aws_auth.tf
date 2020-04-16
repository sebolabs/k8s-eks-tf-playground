resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"

    annotations = {
      managed-by = "Terraform"
    }
  }

  data = {
    mapRoles = data.template_file.k8s_aws_auth_configmap_maproles.rendered
    mapUsers = data.template_file.k8s_aws_auth_configmap_mapusers.rendered
  }
}

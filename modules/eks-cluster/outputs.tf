output "cluster" {
  value       = aws_eks_cluster.main
  description = "The EKS Cluster properties"
}

output "cluster_provsioner_iam_role_arn" {
  value       = aws_iam_role.cluster_provisioner.arn
  description = "The EKS Cluster properties"
}

output "iam_openid_connect_provider" {
  value       = aws_iam_openid_connect_provider.main
  description = "The EKS Cluster IAM OpenID Connect provider properties"
}

output "security_group_id" {
  value       = aws_security_group.cluster.id
  description = ""
}

output "kube_config" {
  value       = data.template_file.kube_config.rendered
  description = ""
}

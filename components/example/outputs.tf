output "__AWS_ACCOUNT_LEVEL_IDENTIFIER__" {
  value = upper(local.aws_account_level_id)
}

output "eks_cluster_provisioner_iam_role_arn" {
  value       = module.eks_cluster.cluster_provsioner_iam_role_arn
  description = ""
}

output "eks_cluster_name" {
  value       = module.eks_cluster.cluster.name
  description = "The EKS Cluster name"
}

output "eks_cluster_endpoint" {
  value       = module.eks_cluster.cluster.endpoint
  description = "The EKS Cluster endpoint"
}

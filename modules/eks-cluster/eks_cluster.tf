resource "aws_eks_cluster" "main" {
  provider = aws.eks_cluster

  name     = local.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids      = [aws_security_group.cluster.id]
    subnet_ids              = var.subnet_ids
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
  }

  enabled_cluster_log_types = var.cluster_enabled_cluster_log_types

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.cluster_name}/ekscluster",
    ),
  )

  depends_on = [
    aws_iam_role_policy_attachment.cluster_provisioner,
    aws_iam_role_policy_attachment.eks_service_policy,
    aws_iam_role_policy_attachment.eks_cluster_policy,
  ]
}

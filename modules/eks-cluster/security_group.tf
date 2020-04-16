resource "aws_security_group" "cluster" {
  name        = "${local.cluster_name}-ekscluster"
  description = "EKS ${upper(local.cluster_name)} Master Cluster Security Group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.cluster_name}/ekscluster",
    ),
  )
}

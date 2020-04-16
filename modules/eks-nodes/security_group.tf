resource "aws_security_group" "main" {
  name        = "${local.aws_account_level_id}-eksnodes-${lookup(var.nodes_config, "group_name")}"
  description = "EKS ${upper(lookup(var.cluster, "id"))} nodes shared security group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/eksnodes/${lookup(var.nodes_config, "group_name")}",
      "kubernetes.io/cluster/${lookup(var.cluster, "id")}", "owned", # TODO
    ),
  )
}

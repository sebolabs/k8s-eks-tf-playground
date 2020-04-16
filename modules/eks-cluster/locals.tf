locals {
  # GENERAL
  aws_account_level_id = format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component,
  )

  aws_global_level_id = format(
    "%s-%s-%s-%s",
    var.project,
    data.aws_caller_identity.current.account_id,
    var.environment,
    var.component,
  )

  parent_module = lookup(
    var.default_tags,
    "Module",
    "",
  )

  default_tags = merge(
    var.default_tags,
    map(
      "Module", local.parent_module == "" ? var.module : format(
        "%s/%s",
        local.parent_module,
        var.module,
      ),
    ),
  )

  # SPECIFIC
  cluster_name = local.aws_account_level_id

  container_insights_cwlgs = [
    "/aws/containerinsights/${aws_eks_cluster.main.id}/application",
    "/aws/containerinsights/${aws_eks_cluster.main.id}/host",
    "/aws/containerinsights/${aws_eks_cluster.main.id}/dataplane",
    "/aws/containerinsights/${aws_eks_cluster.main.id}/performance",
  ]
}

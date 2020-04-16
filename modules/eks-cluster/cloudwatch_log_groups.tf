# https://docs.aws.amazon.com/en_pv/eks/latest/userguide/control-plane-logs.html
resource "aws_cloudwatch_log_group" "cluster" {
  name = "/aws/eks/${local.cluster_name}/cluster"

  retention_in_days = var.cluster_cwlg_retention_in_days

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.cluster_name}/ekscluster",
    ),
  )
}

resource "aws_cloudwatch_log_group" "container_insights" {
  count = length(local.container_insights_cwlgs)
  name  = element(local.container_insights_cwlgs, count.index)

  retention_in_days = var.cluster_cwlg_retention_in_days

  tags = merge(
    local.default_tags,
    map(
      "Name", element(local.container_insights_cwlgs, count.index),
    ),
  )
}

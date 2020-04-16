resource "aws_autoscaling_group" "main" {
  name_prefix = "${local.aws_account_level_id}-eksnodes-${lookup(var.nodes_config, "group_name")}"

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet_ids

  min_size = lookup(lookup(var.nodes_config, "asg_config"), "min_size")
  max_size = lookup(lookup(var.nodes_config, "asg_config"), "max_size")

  desired_capacity = tobool(lookup(lookup(var.nodes_config, "asg_config"), "autoscaling_enabled")) ? null : lookup(lookup(var.nodes_config, "asg_config"), "max_size")

  termination_policies = [
    "OldestInstance",
    "OldestLaunchTemplate",
  ]

  dynamic "tag" {
    for_each = merge(
      local.default_tags,
      map(
        "Name", "${local.aws_account_level_id}/eksnodes/${lookup(var.nodes_config, "group_name")}",
        "kubernetes.io/cluster/${lookup(var.cluster, "id")}", "owned",
      )
    )

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

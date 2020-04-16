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
  vpc_name_tag = var.name != "" ? "${local.aws_account_level_id}/${var.name}" : local.aws_account_level_id

  private_domain_name = var.name != "" ? format(
    "%s.%s.%s.%s.%s",
    var.name,
    var.environment,
    var.component,
    var.project,
    var.private_domain_name_suffix,
  ) : format(
    "%s.%s.%s.%s",
    var.environment,
    var.component,
    var.project,
    var.private_domain_name_suffix,
  )
}

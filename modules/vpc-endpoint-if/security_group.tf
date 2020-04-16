resource "aws_security_group" "main" {
  name        = "${local.aws_account_level_id}-${var.module}"
  description = "VPC EIFs shared security group"
  vpc_id      = var.vpc_id

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/${var.module}",
    ),
  )
}

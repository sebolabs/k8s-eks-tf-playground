resource "aws_vpc_endpoint" "main" {
  count        = length(var.service_names)
  service_name = "com.amazonaws.${data.aws_region.current.name}.${element(var.service_names, count.index)}"

  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
  private_dns_enabled = true

  security_group_ids = concat([aws_security_group.main.id], var.additional_sg_ids)

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/eif/${element(var.service_names, count.index)}",
    )
  )
}

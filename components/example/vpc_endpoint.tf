data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc_core.vpc_id
  service_name = data.aws_vpc_endpoint_service.s3.service_name

  route_table_ids = [
    module.vpc_core.private_route_table_id,
    module.vpc_core.public_route_table_id,
  ]

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/egw/s3",
    )
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/private",
    ),
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/public",
    ),
  )
}

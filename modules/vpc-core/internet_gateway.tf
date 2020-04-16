resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.default_tags,
    map(
      "Name", local.aws_account_level_id,
    ),
  )
}

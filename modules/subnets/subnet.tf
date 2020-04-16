resource "aws_subnet" "main" {
  count                   = length(var.cidr_blocks)
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block              = element(var.cidr_blocks, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)


  tags = merge(
    local.default_tags,
    map(
      "Name", format(
        "%s/%s/%s",
        local.aws_account_level_id,
        var.name,
        element(data.aws_availability_zones.available.names, count.index)
      ),
    ),
  )
}

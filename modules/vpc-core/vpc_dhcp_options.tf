resource "aws_vpc_dhcp_options" "main" {
  domain_name         = local.private_domain_name
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/${local.private_domain_name}",
    ),
  )
}

resource "aws_vpc_dhcp_options_association" "main" {
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.main.id
}

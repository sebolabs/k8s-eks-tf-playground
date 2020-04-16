resource "aws_route53_zone" "main" {
  name    = local.private_domain_name
  comment = "Private ${local.private_domain_name} hosted zone"

  vpc {
    vpc_id = aws_vpc.main.id
  }

  lifecycle {
    ignore_changes = [vpc]
  }

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/${local.private_domain_name}",
    ),
  )
}

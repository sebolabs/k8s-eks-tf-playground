resource "aws_route_table_association" "main" {
  count          = length(var.cidr_blocks)
  subnet_id      = element(aws_subnet.main.*.id, count.index)
  route_table_id = element(var.route_table_ids, count.index)
}

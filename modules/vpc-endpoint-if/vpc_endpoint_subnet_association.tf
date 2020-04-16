resource "aws_vpc_endpoint_subnet_association" "main" {
  count           = length(var.subnet_ids) * length(var.service_names)
  vpc_endpoint_id = element(aws_vpc_endpoint.main.*.id, count.index % length(var.subnet_ids))
  subnet_id       = element(var.subnet_ids, count.index % length(var.service_names))
}

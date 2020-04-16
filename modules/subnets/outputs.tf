output "subnets_ids" {
  value       = aws_subnet.main.*.id
  description = "The IDs of the subnets"
}

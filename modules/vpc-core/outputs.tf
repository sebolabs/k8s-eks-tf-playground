output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The VPC id"
}

output "private_r53_domain_name" {
  value       = local.private_domain_name
  description = "The private R53 zone name"
}

output "private_r53_hosted_zone_id" {
  value       = aws_route53_zone.main.zone_id
  description = "The private R53 zone id"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The private route table id"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "The public route table id"
}

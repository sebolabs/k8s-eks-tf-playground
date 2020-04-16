output "security_group" {
  value       = aws_security_group.main
  description = "The VPC EIF security group properties"
}

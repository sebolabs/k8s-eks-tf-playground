output "security_group" {
  value       = aws_security_group.main
  description = "The EKS Nodes security group properties"
}

output "asg_name" {
  value       = aws_autoscaling_group.main.name
  description = "The EKS Nodes autoscaling group name"
}

output "iam_role" {
  value       = aws_iam_role.main
  description = "The EKS Nodes IAM role properties"
}

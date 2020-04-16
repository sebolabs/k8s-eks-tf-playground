data "aws_ami" "eks_nodes_default" {
  filter {
    name   = "name"
    values = lookup(var.eks_nodes["default"], "ami_name_filters")
  }

  most_recent = lookup(var.eks_nodes["default"], "ami_most_recent", true)
  owners      = lookup(var.eks_nodes["default"], "ami_owners")
}

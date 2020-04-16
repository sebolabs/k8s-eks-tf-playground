resource "aws_security_group_rule" "eks_nodes_egress_vpc_eifs_https" {
  description              = "Allow HTTPS to VPC EIFs"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.eks_nodes_default.security_group.id
  source_security_group_id = module.vpc_endpoint_ifs.security_group.id
}

resource "aws_security_group_rule" "vpc_eifs_ingress_eks_nodes_https" {
  description              = "Allow HTTPS from EKS Nodes"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.vpc_endpoint_ifs.security_group.id
  source_security_group_id = module.eks_nodes_default.security_group.id
}

resource "aws_security_group_rule" "eks_nodes_egress_s3_egw_https" {
  description       = "Allow HTTPS to VPC S3 EGW"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.eks_nodes_default.security_group.id
  prefix_list_ids   = [aws_vpc_endpoint.s3.prefix_list_id]
}

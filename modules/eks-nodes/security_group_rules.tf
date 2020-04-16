# Cluster
resource "aws_security_group_rule" "cluster_egress_nodes" {
  description              = "Allow TCP/1025-65535 to nodes"
  type                     = "egress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = lookup(var.cluster, "security_group_id")
  source_security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "cluster_ingress_nodes_https" {
  description              = "Allow TCP/443 (Api) from nodes (pods)"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = lookup(var.cluster, "security_group_id")
  source_security_group_id = aws_security_group.main.id
}

# Nodes
resource "aws_security_group_rule" "nodes_ingress_self" {
  description       = "Allow ALL/0-65535 nodes comms"
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  self              = true
}

resource "aws_security_group_rule" "nodes_egress_cluster_https" {
  description              = "Allow TCP/443 to cluster (Api)"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.main.id
  source_security_group_id = lookup(var.cluster, "security_group_id")
}

resource "aws_security_group_rule" "nodes_ingress_cluster" {
  description              = "Allow TCP/1025-65535 (kubelets/pods) from cluster"
  type                     = "ingress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.main.id
  source_security_group_id = lookup(var.cluster, "security_group_id")
}

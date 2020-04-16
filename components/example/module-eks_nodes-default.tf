module "eks_nodes_default" {
  source = "../../modules/eks-nodes"

  # GENERAL
  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  # NETWORKING
  vpc_id              = module.vpc_core.vpc_id
  subnet_ids          = module.subnets_eks_nodes.subnets_ids
  private_domain_name = module.vpc_core.private_r53_domain_name

  # CLUSTER
  cluster = {
    id                = module.eks_cluster.cluster.id
    endpoint          = module.eks_cluster.cluster.endpoint
    ca_data           = module.eks_cluster.cluster.certificate_authority.0.data
    security_group_id = module.eks_cluster.security_group_id
  }

  # NODES
  nodes_config = {
    group_name = "default"

    node_labels = [
      "group-name=default",
      "tf-id=${local.aws_account_level_id}",
    ]

    launch_template = {
      ami_id          = data.aws_ami.eks_nodes_default.id
      instance_type   = lookup(var.eks_nodes["default"], "lc_instance_type")
      ebs_volume_size = lookup(var.eks_nodes["default"], "lc_ebs_volume_size")
      key_name        = var.eks_nodes_ssh_key_name
    }

    asg_config = {
      autoscaling_enabled = tobool(lookup(var.eks_nodes["default"], "asg_autoscaling_enabled"))
      min_size            = lookup(var.eks_nodes["default"], "asg_min_size")
      max_size            = lookup(var.eks_nodes["default"], "asg_max_size")
    }
  }
}

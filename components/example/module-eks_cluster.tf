module "eks_cluster" {
  source = "../../modules/eks-cluster"

  # GENERAL
  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  # NETWORKING
  vpc_id     = module.vpc_core.vpc_id
  subnet_ids = module.subnets_eks_cluster.subnets_ids

  # CLUSTER
  cluster_version = var.eks_cluster_version

  cluster_endpoint_public_access  = true  # TODO
  cluster_endpoint_private_access = true  # TODO

  # LOGGING # TODO
  cluster_enabled_cluster_log_types = [
    "api",
    # "audit",
    # "authenticator",
    # "controllerManager",
    # "scheduler",
  ]

  cluster_cwlg_retention_in_days = 3
}

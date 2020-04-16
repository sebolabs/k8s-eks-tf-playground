module "vpc_endpoint_ifs" {
  source = "../../modules/vpc-endpoint-if"

  # GENERAL
  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  # SERVICES
  service_names = var.vpc_eifs_service_names

  # NETWORK
  vpc_id     = module.vpc_core.vpc_id
  subnet_ids = module.subnets_vpc_eifs.subnets_ids
}

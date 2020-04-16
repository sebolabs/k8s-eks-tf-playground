module "vpc_core" {
  source = "../../modules/vpc-core"

  # GENERAL
  project      = var.project
  environment  = var.environment
  component    = var.component
  default_tags = local.default_tags

  # SPECIFIC
  vpc_cidr_block = var.vpc_cidr_block
}

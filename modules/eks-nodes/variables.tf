# GENERAL
variable "project" {
  type        = string
  description = "The project name (comes from component)"
}

variable "environment" {
  type        = string
  description = "The environment name (comes from component)"
}

variable "component" {
  type        = string
  description = "The TF component name (comes from component)"
}

variable "module" {
  type        = string
  description = "The module name"
  default     = "eks"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be applied to all taggable resources ( main ones come from component)"
  default     = {}
}

# SPECIFIC
variable "private_domain_name" {
  type        = string
  description = "The R53 private domain name"
}

variable "bootstrap_config_rendered" {
  type        = string
  description = ""
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "subnet_ids" {
  type        = list
  description = "List of subnets to create the cluster and workers in"
}

variable "additional_sg_ids" {
  type        = list
  description = "A list of security groups to assign to nodes interface in addition to the one created in this module"
  default     = []
}

variable "nodes_config" {}

variable "cluster" {
  type        = map
  description = ""
}

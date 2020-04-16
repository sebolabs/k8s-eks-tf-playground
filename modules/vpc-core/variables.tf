# GENERAL
variable "project" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The TF component name"
}

variable "module" {
  type        = string
  description = "The module name"
  default     = "vpc-core"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to be applied to all taggable resources"
  default     = {}
}

# SPECIFIC
variable "name" {
  type        = string
  description = "The VPC name. Use if ther are multiple VPC in one component."
  default     = ""
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "private_domain_name_suffix" {
  type        = string
  description = "The R53 private domain name suffix"
  default     = "aws"
}

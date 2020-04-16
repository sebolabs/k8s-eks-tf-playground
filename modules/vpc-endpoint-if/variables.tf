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
  default     = "vpc-endpoint-if"
}

variable "default_tags" {
  type        = map
  description = "Default tags to be applied to all taggable resources"
  default     = {}
}

# SPECIFIC
variable "service_names" {
  type        = list
  description = "List of names of the services to create an Interface VPC Endpoint for, e.g. kms, ec2"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to attach the endpoint to"
}

variable "subnet_ids" {
  type        = list
  description = "List of subnet IDs"
}

variable "additional_sg_ids" {
  type        = list
  description = "A list of security groups to assign to the endpoint interface in addition to the one created in this module"
  default     = []
}

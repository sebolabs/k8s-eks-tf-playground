variable "project" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "The project name"
}

variable "component" {
  type        = string
  description = "The component name"
}

variable "module" {
  type        = string
  description = "This module name"
  default     = "subnets"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all taggable resources"
  default     = {}
}

variable "name" {
  type        = string
  description = "A common name for resources used in this module"
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availablity zones for subnets creation"
  default     = []
}

variable "cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks used for blue subnets creation - defines the total number to be created"
  default     = []
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances should be assigned a public IP address"
  default     = false
}

variable "route_table_ids" {
  type        = list(string)
  description = "A list of route tables for subnets association. Specify one route table to be shared by all subnets or one route table for each subnet"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

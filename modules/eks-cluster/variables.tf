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
variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "subnet_ids" {
  type        = list
  description = "The VPC ID"
}

variable "cluster_version" {
  type        = string
  description = "Desired Kubernetes master version"
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
}

variable "cluster_enabled_cluster_log_types" {
  type        = list(string)
  description = "A list of the desired control plane logging to enable"
  default     = []
}

variable "cluster_cwlg_retention_in_days" {
  type        = string
  description = "Specifies the number of days you want to retain log events in the specified log group"
}

# GENERAL
variable "aws_region" {
  type        = string
  description = "The AWS Region"
}

variable "project" {
  type        = string
  description = "The Project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The TF component name"
  default     = "example"
}

# VPC
variable "vpc_cidr_block" {
  type        = string
  description = ""
}

variable "vpc_eifs_subnets_cidr_blocks" {
  type        = list
  description = ""
}

variable "vpc_eifs_service_names" {
  type        = list
  description = ""
}

# EKS-CLUSTER
variable "eks_cluster_version" {
  type        = string
  description = ""
}

variable "eks_cluster_subnets_cidr_blocks" {
  type        = list
  description = ""
}

variable "eks_cluster_admin_list" {
  type        = list
  description = ""
  default     = []
}

# EKS-NODES
variable "eks_nodes_subnets_cidr_blocks" {
  type        = list
  description = ""
}

variable "eks_nodes" {
  type        = map
  description = ""
}

variable "eks_nodes_ssh_key_name" {
  type        = string
  description = ""
}

#
# GENERAL
#
environment = "test"

#
# VPC
#
vpc_cidr_block = "10.123.0.0/16"

vpc_eifs_subnets_cidr_blocks = [
  "10.123.1.0/28",
]

vpc_eifs_service_names = [
  "ec2",      # to interact with EC2
  "sts",      # to assume IAM roles
  "ecr.dkr",  # to pull images from ECR
  "ecr.api",  # to authenticate against ECR
]

#
# EKS-CLUSTER
#
eks_cluster_version = "1.15"

eks_cluster_subnets_cidr_blocks = [
  "10.123.0.0/28",
  "10.123.0.16/28",
]

eks_cluster_admin_list = [
  "admin@cluster.eks.my",
]

#
# EKS-NODES
#
eks_nodes_subnets_cidr_blocks = [
  "10.123.0.64/28",
  "10.123.0.48/28",
]

eks_nodes = {
  default = {
    lc_ebs_volume_size       = 5
    lc_instance_type         = "m5.large"
    ami_name_filters         = ["amazon-eks-node-1.15-v*"]
    ami_owners               = ["602401143452"]
    ami_most_recent          = true
    asg_autoscaling_enabled  = false
    asg_min_size             = 0
    asg_max_size             = 1
    asg_scaledown_recurrence = "00 20 * * 1-5"
    asg_scaleup_recurrence   = "00 10 * * 1-5"
  }
}

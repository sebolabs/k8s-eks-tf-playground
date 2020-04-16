data "aws_iam_user" "eks_cluster_admin_users" {
  count     = length(var.eks_cluster_admin_list)
  user_name = element(var.eks_cluster_admin_list, count.index)
}

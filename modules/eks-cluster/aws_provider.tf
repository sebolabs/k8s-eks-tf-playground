provider "aws" {
  alias               = "eks_cluster"
  region              = data.aws_region.current.name
  allowed_account_ids = [data.aws_caller_identity.current.account_id]

  assume_role {
    role_arn     = aws_iam_role.cluster_provisioner.arn
    session_name = "tf.${local.aws_account_level_id}"
  }
}

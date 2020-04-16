data "aws_iam_policy_document" "cluster_provisioner_assumerole" {
  statement {
    sid     = "AllowEksClusterProvisionerAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}

resource "aws_iam_role" "cluster_provisioner" {
  name = "${local.aws_account_level_id}-ekscluster-provisioner"

  assume_role_policy = data.aws_iam_policy_document.cluster_provisioner_assumerole.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/ekscluster-provisioner",
    ),
  )
}

data "aws_iam_policy_document" "cluster_provisioner" {
  statement {
    sid    = "AllowEksCreateCluster"
    effect = "Allow"

    actions = [
      "ec2:Describe*",
      "eks:List*",
      "eks:Describe*",
      "eks:CreateCluster",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowEksIamPassRole"
    effect = "Allow"

    actions = [
      "iam:PassRole",
    ]

    resources = [aws_iam_role.cluster.arn]
  }

  statement {
    sid       = "AllowEksAll"
    effect    = "Allow"
    actions   = ["eks:*"]
    resources = ["arn:aws:eks:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:cluster/${local.cluster_name}"]
  }
}

resource "aws_iam_policy" "cluster_provisioner" {
  name        = "${local.aws_account_level_id}-ekscluster-provisioner"
  description = "EKS Cluster ${upper(local.aws_account_level_id)} Provisioner permissions"
  policy      = data.aws_iam_policy_document.cluster_provisioner.json
}

resource "aws_iam_role_policy_attachment" "cluster_provisioner" {
  role       = aws_iam_role.cluster_provisioner.name
  policy_arn = aws_iam_policy.cluster_provisioner.arn
}

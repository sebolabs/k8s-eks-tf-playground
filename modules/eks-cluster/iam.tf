data "aws_iam_policy_document" "eks_assumerole" {
  statement {
    sid    = "AllowEKSAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "eks.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "cluster" {
  name               = "${local.cluster_name}-ekscluster"
  assume_role_policy = data.aws_iam_policy_document.eks_assumerole.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.cluster_name}/ekscluster",
    ),
  )
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.name
}

resource "aws_iam_role_policy_attachment" "eks_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster.name
}

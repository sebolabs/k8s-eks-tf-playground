data "aws_iam_policy_document" "ec2_assumerole" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "main" {
  name               = "${local.aws_account_level_id}-eksnodes-${lookup(var.nodes_config, "group_name")}"
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.aws_account_level_id}/eksnodes/${lookup(var.nodes_config, "group_name")}"
    ),
  )
}

resource "aws_iam_role_policy_attachment" "eks_worker_node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "eks_cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.main.name
}

resource "aws_iam_role_policy_attachment" "eks_ecr_ro" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.main.name
}

resource "aws_iam_instance_profile" "main" {
  name = "${local.aws_account_level_id}-eksnodes-${lookup(var.nodes_config, "group_name")}"
  role = aws_iam_role.main.name
}

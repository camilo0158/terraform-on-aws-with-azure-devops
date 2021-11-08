resource "aws_iam_policy" "db_admin" {
  name = "BDAdminAccess"
  policy = data.aws_iam_policy_document.db_admin.json
}

data "aws_iam_policy_document" "db_admin" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "rds:DescribeDBInstances",
      "rds:DescribeDBClusters",
      "rds:DescribeGlobalClusters",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "rds:RebootDBInstance",
      "rds:StartDBInstance",
      "rds:StopDBInstance",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalTag/Department"
      values   = ["DBAdmins"]
    }

    condition {
      test     = "StringEquals"
      variable = "rds:db-tag/Environment"
      values   = ["Dev"]
    }
  }
}

resource "aws_iam_group" "db_admin_group" {
  name = "SWO_DBAdmins"
}

resource "aws_iam_group_policy_attachment" "db_admin" {
  group = aws_iam_group.db_admin_group.name
  policy_arn = aws_iam_policy.db_admin.arn
}
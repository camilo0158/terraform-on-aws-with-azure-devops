resource "aws_iam_policy" "admin" {
  name   = "AdminAccess"
  policy = data.aws_iam_policy_document.admin.json
}

data "aws_iam_policy_document" "admin" {
  statement {
    sid = "1"

    actions = [
      "*"
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_group" "admin_group" {
  name = "SWO_Admins"
}

resource "aws_iam_group_policy_attachment" "admin" {
  group      = aws_iam_group.admin_group.name
  policy_arn = aws_iam_policy.admin.arn
}

resource "aws_iam_group_policy_attachment" "force_mfa_common_policie" {
  count = length(var.common_policies)
  group = aws_iam_group.admin_group.name
  policy_arn = var.common_policies[count.index]
}

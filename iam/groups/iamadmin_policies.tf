resource "aws_iam_policy" "iam_admin" {
  name = "IAMAdminAccess"
  policy = data.aws_iam_policy_document.iam_admin.json
}

data "aws_iam_policy_document" "iam_admin" {
  statement {
    sid       = "1"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["iam:*"]
  }
}

resource "aws_iam_group" "iam_admin_group" {
  name = "SWO_IAMAdmins"
}

resource "aws_iam_group_policy_attachment" "iam_admin" {
  group = aws_iam_group.iam_admin_group.name
  policy_arn = aws_iam_policy.iam_admin.arn
}


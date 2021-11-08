resource "aws_iam_policy" "sys_admin" {
  name = "SysAdminAccess"
  policy = data.aws_iam_policy_document.sys_admin.json
}

data "aws_iam_policy_document" "sys_admin" {
  statement {
    sid       = "AllowManageProfilesToEC2"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "iam:ListInstanceProfiles",
      "iam:CreateInstanceProfile",
      "iam:AddRoleToInstanceProfile",
      "ec2:AssociateIamInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
      "iam:DeleteInstanceProfile",
      "iam:GetRole",
      "iam:PassRole",
      "iam:ListRoles",
      "iam:ListAttachedRolePolicies",
    ]
  }

  statement {
    sid       = "AllowListSystemManagerToEC2"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ssm:DescribeInstanceInformation"]
  }

  statement {
    sid       = "AllowGetEnrollmentStatusToEC2"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["compute-optimizer:GetEnrollmentStatus"]
  }

  statement {
    sid       = "AllowAccessToCloudWatch"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "cloudwatch:ListMetrics",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:GetMetricStatistics",
    ]
  }

  statement {
    sid       = "AllowFullAccessToEC2"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ec2:*"]
  }

  statement {
    sid       = "AllowConnectInstanceToEC2"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ec2-instance-connect:*"]
  }

  statement {
    sid       = "AllowFullAccessToELB"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["elasticloadbalancing:*"]
  }

  statement {
    sid       = "AllowFullAccessToAutoScaling"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["autoscaling:*"]
  }

  statement {
    sid       = "AllowFullAccessToS3"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["s3:*"]
  }

  statement {
    sid       = "AllowFullAccessToLambda"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["lambda:*"]
  }

  statement {
    sid       = "AllowAccesToCloudWatchLogs"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:GetLogEvents",
      "logs:CreateLogGroup",
    ]
  }

  statement {
    sid       = "AllowFullAccessToBeanstalk"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["elasticbeanstalk:*"]
  }

  statement {
    sid       = "AllowFullAccessToECS"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ecs:*"]
  }

  statement {
    sid       = "AllowFullAccessToECR"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ecr:*"]
  }

  statement {
    sid       = "AllowFullAccessToEKS"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["eks:*"]
  }

  statement {
    sid       = "AllowAccessToAWSAppMesh"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["appmesh:ListMeshes"]
  }

  statement {
    sid       = "AllowFullAccessToRDS"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["rds:*"]
  }

  statement {
    sid       = "AllowFullAccessToCF"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["cloudformation:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodeBuild"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codebuild:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodeCommit"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codecommit:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodeDeploy"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codedeploy:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodePipeline"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codepipeline:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodeStar"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codestar:*"]
  }

  statement {
    sid       = "AllowFullAccessToCodeStarNotifications"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["codestar-notifications:*"]
  }

  statement {
    sid       = "AllowAccessToExecuteApiGateway"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["execute-api:*"]
  }

  statement {
    sid       = "AllowFullAccessToApiGateway"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["apigateway:*"]
  }

  statement {
    sid       = "AllowAccessToWAFRegional"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "waf-regional:AssociateWebACL",
      "waf-regional:ListWebACLs",
    ]
  }

  statement {
    sid       = "AllowAccessToWAFV2Regional"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "wafv2:AssociateWebACL",
      "wafv2:ListWebACLs",
    ]
  }

  statement {
    sid       = "AllowAccessToCognitoUserPools"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["cognito-idp:ListUserPools"]
  }

  statement {
    sid       = "AllowFullAccessToSNS"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["sns:*"]
  }

  statement {
    sid       = "AllowFullAccessToSSM"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "cloudwatch:PutMetricData",
      "ds:CreateComputer",
      "ds:DescribeDirectories",
      "ec2:DescribeInstanceStatus",
      "logs:*",
      "ssm:*",
      "ec2messages:*",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"]
    actions   = ["iam:CreateServiceLinkedRole"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["ssm.amazonaws.com"]
    }
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"]

    actions = [
      "iam:DeleteServiceLinkedRole",
      "iam:GetServiceLinkedRoleDeletionStatus",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]
  }

  statement {
    sid       = "AllowFullAccessToSecretManager"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "secretsmanager:*",
      "cloudformation:CreateChangeSet",
      "cloudformation:DescribeChangeSet",
      "cloudformation:DescribeStackResource",
      "cloudformation:DescribeStacks",
      "cloudformation:ExecuteChangeSet",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs",
      "kms:DescribeKey",
      "kms:ListAliases",
      "kms:ListKeys",
      "lambda:ListFunctions",
      "rds:DescribeDBClusters",
      "rds:DescribeDBInstances",
      "redshift:DescribeClusters",
      "tag:GetResources",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:lambda:*:*:function:SecretsManager*"]

    actions = [
      "lambda:AddPermission",
      "lambda:CreateFunction",
      "lambda:GetFunction",
      "lambda:InvokeFunction",
      "lambda:UpdateFunctionConfiguration",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:serverlessrepo:*:*:applications/SecretsManager*"]

    actions = [
      "serverlessrepo:CreateCloudFormationChangeSet",
      "serverlessrepo:GetApplication",
    ]
  }

  statement {
    sid    = ""
    effect = "Allow"

    resources = [
      "arn:aws:s3:::awsserverlessrepo-changesets*",
      "arn:aws:s3:::secrets-manager-rotation-apps-*/*",
    ]

    actions = ["s3:GetObject"]
  }

  statement {
    sid       = "AllowFullAccessToKeyManagementService"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["kms:*"]
  }

  statement {
    sid       = "AllowFullAccessToCloudHSM"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["cloudhsm:*"]
  }
}

resource "aws_iam_group" "sys_admin_group" {
  name = "SWO_SysAdmins"
}

resource "aws_iam_group_policy_attachment" "sys_admin" {
  group = aws_iam_group.sys_admin_group.name
  policy_arn = aws_iam_policy.sys_admin.arn
}
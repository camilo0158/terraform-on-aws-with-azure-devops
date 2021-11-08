resource "aws_iam_policy" "developer" {
  name = "DeveloperAccess"
  policy = data.aws_iam_policy_document.developer.json
}

data "aws_iam_policy_document" "developer" {
  statement {
    sid       = "EC2DescribeInstanceAccess"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["ec2:DescribeInstances"]
  }

  statement {
    sid       = "EC2ManageAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ec2:RunInstances",
      "ec2:StartInstances",
      "ec2:StopInstances",
    ]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/Environment"
      values   = ["Development"]
    }
  }

  statement {
    sid       = "S3RulesAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:GetObject",
      "s3:GetBucketLocation",
      "s3:GetObjectAcl",
      "s3:ListBucket",
      "s3:ListAllMyBuckets",
      "s3:PutObject",
      "s3:PutObjectAcl",
    ]
  }

  statement {
    sid       = "LambdaReadOnlyAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "lambda:GetAccountSettings",
      "lambda:GetAlias",
      "lambda:GetEventSourceMapping",
      "lambda:GetFunction",
      "lambda:GetFunctionConcurrency",
      "lambda:GetFunctionConfiguration",
      "lambda:GetLayerVersion",
    ]
  }

  statement {
    sid       = "LambdaRulesAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "lambda:AddPermission",
      "lambda:PutFunctionConcurrency",
    ]
  }

  statement {
    sid       = "ECSRulesAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecs:DescribeClusters",
      "ecs:DescribeContainerInstances",
      "ecs:DescribeTasks",
      "ecs:ListClusters",
      "ecs:ListTasks",
      "ecs:RunTask",
      "ecs:StartTask",
      "ecs:StopTask",
    ]
  }

  statement {
    sid       = "EKSRulesAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "eks:AccessKubernetesApi",
      "eks:DescribeCluster",
      "eks:DescribeNodegroup",
      "eks:ListClusters",
      "eks:ListFargateProfiles",
      "eks:ListNodegroups",
      "eks:ListUpdates",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "codecommit:AssociateApprovalRuleTemplateWithRepository",
      "codecommit:BatchAssociateApprovalRuleTemplateWithRepositories",
      "codecommit:BatchDisassociateApprovalRuleTemplateFromRepositories",
      "codecommit:BatchGet*",
      "codecommit:BatchDescribe*",
      "codecommit:Create*",
      "codecommit:DeleteBranch",
      "codecommit:DeleteFile",
      "codecommit:Describe*",
      "codecommit:DisassociateApprovalRuleTemplateFromRepository",
      "codecommit:EvaluatePullRequestApprovalRules",
      "codecommit:Get*",
      "codecommit:List*",
      "codecommit:Merge*",
      "codecommit:OverridePullRequestApprovalRules",
      "codecommit:Put*",
      "codecommit:Post*",
      "codecommit:TagResource",
      "codecommit:Test*",
      "codecommit:UntagResource",
      "codecommit:Update*",
      "codecommit:GitPull",
      "codecommit:GitPush",
    ]
  }

  statement {
    sid       = "KeyManagementServiceReadAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncryptFrom",
      "kms:ReEncryptTo",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext",
      "kms:DescribeKey",
    ]
  }

  statement {
    sid       = "CloudWatchEventsCodeCommitRulesAccess"
    effect    = "Allow"
    resources = ["arn:aws:events:*:*:rule/codecommit*"]

    actions = [
      "events:DeleteRule",
      "events:DescribeRule",
      "events:DisableRule",
      "events:EnableRule",
      "events:PutRule",
      "events:PutTargets",
      "events:RemoveTargets",
      "events:ListTargetsByRule",
    ]
  }

  statement {
    sid       = "SNSTopicAndSubscriptionAccess"
    effect    = "Allow"
    resources = ["arn:aws:sns:*:*:codecommit*"]

    actions = [
      "sns:Subscribe",
      "sns:Unsubscribe",
    ]
  }

  statement {
    sid       = "SNSTopicAndSubscriptionReadAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "sns:ListTopics",
      "sns:ListSubscriptionsByTopic",
      "sns:GetTopicAttributes",
    ]
  }

  statement {
    sid       = "LambdaReadOnlyListAccess"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["lambda:ListFunctions"]
  }

  statement {
    sid       = "IAMReadOnlyListAccess"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["iam:ListUsers"]
  }

  statement {
    sid       = "IAMReadOnlyConsoleAccess"
    effect    = "Allow"
    resources = ["arn:aws:iam::*:user/$${aws:username}"]

    actions = [
      "iam:ListAccessKeys",
      "iam:ListSSHPublicKeys",
      "iam:ListServiceSpecificCredentials",
    ]
  }

  statement {
    sid       = "IAMUserSSHKeys"
    effect    = "Allow"
    resources = ["arn:aws:iam::*:user/$${aws:username}"]

    actions = [
      "iam:DeleteSSHPublicKey",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey",
    ]
  }

  statement {
    sid       = "IAMSelfManageServiceSpecificCredentials"
    effect    = "Allow"
    resources = ["arn:aws:iam::*:user/$${aws:username}"]

    actions = [
      "iam:CreateServiceSpecificCredential",
      "iam:UpdateServiceSpecificCredential",
      "iam:DeleteServiceSpecificCredential",
      "iam:ResetServiceSpecificCredential",
    ]
  }

  statement {
    sid       = "CodeStarNotificationsReadWriteAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "codestar-notifications:CreateNotificationRule",
      "codestar-notifications:DescribeNotificationRule",
      "codestar-notifications:UpdateNotificationRule",
      "codestar-notifications:Subscribe",
      "codestar-notifications:Unsubscribe",
    ]

    condition {
      test     = "StringLike"
      variable = "codestar-notifications:NotificationsForResource"
      values   = ["arn:aws:codecommit:*"]
    }
  }

  statement {
    sid       = "CodeStarNotificationsListAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "codestar-notifications:ListNotificationRules",
      "codestar-notifications:ListTargets",
      "codestar-notifications:ListTagsforResource",
      "codestar-notifications:ListEventTypes",
    ]
  }

  statement {
    sid       = "AmazonCodeGuruReviewerFullAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "codeguru-reviewer:AssociateRepository",
      "codeguru-reviewer:DescribeRepositoryAssociation",
      "codeguru-reviewer:ListRepositoryAssociations",
      "codeguru-reviewer:DisassociateRepository",
      "codeguru-reviewer:DescribeCodeReview",
      "codeguru-reviewer:ListCodeReviews",
    ]
  }

  statement {
    sid       = "AmazonCodeGuruReviewerSLRCreation"
    effect    = "Allow"
    resources = ["arn:aws:iam::*:role/aws-service-role/codeguru-reviewer.amazonaws.com/AWSServiceRoleForAmazonCodeGuruReviewer"]
    actions   = ["iam:CreateServiceLinkedRole"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["codeguru-reviewer.amazonaws.com"]
    }
  }

  statement {
    sid       = "CloudWatchEventsManagedRules"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "events:PutRule",
      "events:PutTargets",
      "events:DeleteRule",
      "events:RemoveTargets",
    ]

    condition {
      test     = "StringEquals"
      variable = "events:ManagedBy"
      values   = ["codeguru-reviewer.amazonaws.com"]
    }
  }

  statement {
    sid       = "CodeStarNotificationsChatbotAccess"
    effect    = "Allow"
    resources = ["*"]
    actions   = ["chatbot:DescribeSlackChannelConfigurations"]
  }

  statement {
    sid       = "CodeStarConnectionsReadOnlyAccess"
    effect    = "Allow"
    resources = ["arn:aws:codestar-connections:*:*:connection/*"]

    actions = [
      "codestar-connections:ListConnections",
      "codestar-connections:GetConnection",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ssm:Describe*",
      "ssm:Get*",
      "ssm:List*",
    ]
  }
}

resource "aws_iam_group" "developer_group" {
  name = "SWO_Developers"
}

resource "aws_iam_group_policy_attachment" "developer" {
  group = aws_iam_group.developer_group.name
  policy_arn = aws_iam_policy.developer.arn
}
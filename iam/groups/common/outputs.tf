output "common_policies" {
  value = [
      aws_iam_policy.enforce_mfa.arn
  ]
}
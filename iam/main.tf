provider "aws" {
  region = var.region
}

module "common_policies" {
  source = "./groups/common"
}

module "groups" {
  source          = "./groups"
  common_policies = module.common_policies.common_policies
}

resource "aws_iam_user_group_membership" "apps_admin_users" {
  for_each = toset(var.users.apps.admins)
  groups   = [module.groups.admin.name]
  user     = each.key
}

resource "aws_iam_user_group_membership" "sys_admin_users" {
  for_each = toset(var.users.sys_admin.users)
  groups   = [module.groups.sys_admin.name]
  user     = each.key
}

resource "aws_iam_user_group_membership" "developer_users" {
  for_each = toset(var.users.developer.users)
  groups   = [module.groups.developer.name]
  user     = each.key
}

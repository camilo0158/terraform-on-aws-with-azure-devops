terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket-0158"
    key     = "terraform-state/main-us-east-2-IAM.tfstate"
    region  = "us-east-2"
    encrypt = "true"
    acl     = "bucket-owner-full-control"
  }
}
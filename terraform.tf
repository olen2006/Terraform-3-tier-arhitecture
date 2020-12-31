#####################################
#
# Developed using Terraform v0.14.3
# provider registry.terraform.io/hashicorp/aws v3.22.0
#
# Terraform AWS Provider Version 3 Upgrade Guide for future updates
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-3-upgrade
#
#####################################

provider "aws" {
  profile = var.aws_profile
  region  = var.region
}

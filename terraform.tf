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


module "security-group" {
  source  = "terraform-aws-modules/security-group/aws" # AWS
  version = "3.17.0"
  # insert the 2 required variables here
  name   = "Nginx-SG"
  vpc_id = module.vpc.vpc_id

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = [

    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    env     = "production"
    project = "my-project"
    owner   = "ayushsharma.in"
  }
}
#####################################################
module "sg2-ayushsharma-in" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "mysg2-ayushsharma.in"
  description = "HTTP security group."
  vpc_id      = module.vpc.vpc_id

  egress_cidr_blocks = ["0.0.0.0/0"]

  ingress_cidr_blocks = ["10.0.0.0/16"]

  ingress_rules = ["https-443-tcp"]

  tags = {
    env     = "production"
    project = "my-project"
    owner   = "ayushsharma.in"
  }
}

#####################################################





####################infra-module#####################
module "nginx-sg" {
  source      = "git::https://bitbucket.flyht.net/scm/doam/infra-modules.git//security_group/"
  vpc_id      = module.vpc.vpc_id
  name        = var.nginx_name
  description = var.nginx_description
  custom_tags = var.custom_tags
  ports_cidr  = var.ports_cidr
  ports_sgid  = var.ports_sgid
}
#####################################################



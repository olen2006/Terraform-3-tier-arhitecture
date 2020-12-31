##########################################
# VPC Module: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
# 
##########################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"
  # insert the 14 required variables here
  name             = "${var.project}-${var.env}"
  cidr             = var.vpc_cidr
  azs              = slice(data.aws_availability_zones.available.names, 0, var.az_subnet_count)
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway     = false
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  create_database_subnet_group = true
  database_subnet_suffix       = var.database_subnet_suffix

  tags = merge(var.custom_tags, { "Env" = var.env, "Project" = var.project })
}

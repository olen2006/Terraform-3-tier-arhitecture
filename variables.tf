variable "region" {
  description = "AWS Region of deployment"
  type        = string
}
variable "aws_profile" {
  type = string
}
# VPC variables
variable "project" {
  description = "Project name"
  type        = string
}
variable "env" {
  description = "Deployment environment: dev, stage, prod"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
}

# Network variables
variable "public_subnets" {
  description = "Public subnets list"
  type        = list(string)
}
variable "private_subnets" {
  description = "Private subnets list"
  type        = list(string)
}
variable "database_subnets" {
  description = "Database Private subnets list"
  type        = list(string)
}

variable "database_subnet_suffix" {
  description = "Suffix to append to database subnets name"
  type        = string
}

variable "az_subnet_count" {
  description = "Number of subnets to deploy"
  type        = number
}
variable "custom_tags" {
  description = "A map of custom tags with key value pairs which will used for the VPC resources"
  type        = map(any)
}

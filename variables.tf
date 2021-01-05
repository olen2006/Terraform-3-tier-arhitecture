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
variable "subnet_count" {
  description = "Number of subnets to deploy"
  type        = number
}
variable "custom_tags" {
  description = "A map of custom tags with key value pairs which will used for the VPC resources"
  type        = map(any)
}

# Security Group variables
variable "nginx_rules" {
  description = "Map of known security group rules (define as 'name' = ['from port', 'to port', 'protocol', 'description'])"
  type        = map(list(any))
}
variable "nginx_name" {
  description = "Security Group Name"
  type        = string

}

variable "nginx_description" {
  description = "The description for the security group"
  type        = string
}

variable "ports_cidr" {
  description = "A list of ports:protocol:cidr_block:description for the security group rule"
  type        = list(any)
}
variable "ports_sgid" {
  description = "A list of ports:protocol:secuity_group_id:description for the security group rule"
  type        = list(any)
}

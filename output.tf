output "latest_amazon_linux_2_id" {
  value = data.aws_ami.latest_amazon_linux_2.id
}

output "latest_amazon_linux_2_name" {
  value = data.aws_ami.latest_amazon_linux_2.name
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}
output "azs" {
  value = module.vpc.azs
}

# output "subnet_count" {
#   value = length(data.aws_availability_zones.available.names) #= 4
# }


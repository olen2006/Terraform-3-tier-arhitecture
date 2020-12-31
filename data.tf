data "aws_availability_zones" "available" {}
# always get the latest version
data "aws_ami" "latest_amazon_linux_2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}



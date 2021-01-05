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

resource "aws_launch_configuration" "web" {
  #name            = "Webserver-HA-LC"
  name_prefix     = "Nginx-HA-LC-"
  image_id        = data.aws_ami.latest_amazon_linux_2.id
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.web_sg.id]
  user_data       = file("user_data.sh")
  lifecycle {
    create_before_destroy = true
  }
}
#-----------------Auto Scaling Group--------------------------
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/autoscaling_group
resource "aws_autoscaling_group" "nginx" {
  name                 = "ASG-${aws_launch_configuration.web}"
  launch_configuration = aws_launch_configuration.web
  min_size             = 2
  max_size             = 2
  min_elb_capacity     = 2 # alb will do health check on both to signal they are good.
  health_check_type    = "ELB"
  vpc_zone_identifier  = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id] ####
  load_balancers       = [aws_elSobchakweSobchakname]                                           ####

  dynamic "tag" {
    for_each = {
      Name   = "Webserver in ASG Server"
      Owner  = "Walter Sobchak"
      TAGKEY = "TAGVALUE"
    }
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  lifecycle {
    create_before_destroy = true # deploy new ASG first then destroy old one
  }
}

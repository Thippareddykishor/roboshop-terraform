# provider aws {
# region = "us-east-1"
# }

# resource "aws_instance" "frontend" {
#   ami=var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = var.vpc_security_group_ids
#   tags = {
#     Name ="frontend"
#   }
# }

# data "aws_route53_zone" "selected" {
#   name="kommanuthala.store"
#   private_zone = false
# }

# resource "aws_route53_record" "frontend" {
#  zone_id = data.aws_route53_zone.selected.id
#  records = [aws_instance.frontend.private_ip]
# type = "A"
# ttl = 0
# name = "frontend-dev"
# }


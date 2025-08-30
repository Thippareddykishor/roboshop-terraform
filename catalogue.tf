resource "aws_instance" "catalogue" {
    ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name= "Catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  name = "catalogue-dev"
  type = "A"
  records = [aws_instance.catalogue.private_ip]
  ttl = 10
  zone_id = data.aws_route53_zone.selected
}
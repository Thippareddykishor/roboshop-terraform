resource "aws_instance" "catalogue" {
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]
  tags = {
    Name= "Catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  name = "catalogue-devv"
  type = "A"
  records = [aws_instance.catalogue.private_ip]
  ttl = 10
  zone_id = data.aws_route53_zone.selected
}
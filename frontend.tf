provider aws {

}

resource "aws_instance" "frontend" {
  ami="ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]
  tags = {
    Name ="frontend"
  }
}

data "aws_route53_zone" "selected" {
  name="kommanuthala.store"
  private_zone = false
}

resource "aws_route53_record" "frontend" {
 zone_id = data.aws_route53_zone.selected.id
 records = [aws_instance.frontend.private_ip]
type = "A"
ttl = 0
name = "frontend-devv"
}


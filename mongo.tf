resource "aws_instance" "mongo" {
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]
  tags = {
    Name= "Mongo"
  }
}


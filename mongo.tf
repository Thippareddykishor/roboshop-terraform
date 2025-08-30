resource "aws_instance" "mongo" {
  instance_type = "t3.micro"
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]
  tags = {
    Name= "Mongo"
  }
}


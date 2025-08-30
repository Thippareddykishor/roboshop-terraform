module "ec2" {
  source                  = "./modules/ec2"
  instance_type           = "t2.micro"
  name                    = "example-ec2"
  ami_id                  = "ami-12345678"
  vpc_security_group_ids  = ["sg-12345678"]
  zone_id                 = "Z1234567890"
  env                     = "dev"
}
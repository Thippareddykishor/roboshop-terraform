instances = {
    catalogue = {
      ami_id="ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    
    }
    frontend  = {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
    mongodb   = {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
  }

  zone_id = "Z098768411FUL8QFJIGI"

  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]

  env="prod"
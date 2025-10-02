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

  zone_id = "Z05764853PUNNX41R0FK9"

  vpc_security_group_ids = ["sg-08c93f3c6fe640a6b"]

  env="prod"
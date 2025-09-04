instances = {
    
    # mongodb   = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # catalogue = {
    #   ami_id="ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    
    # frontend  = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    
    # redis = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # cart = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # user = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # shipping={
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # mysql={
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # rabbitmq={
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    # payment= {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
  }

  zone_id = "Z10310253KPZLFJOC7YEK"

  vpc_security_group_ids = ["sg-0a1b50421de0cb519"]

  env="dev"

  eks ={
    main ={
    subnets=["subnet-00d643a230b615c78","subnet-07f698b9bb982a341"]
    eks_version=1.32
    }
  }
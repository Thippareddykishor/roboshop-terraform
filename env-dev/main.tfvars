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
    subnets=["subnet-04a0fd20c44b90c2f","subnet-07f698b9bb982a341"]
    eks_version=1.32
    node_groups= {
      main = {
        min_nodes = 1
        max_nodes =2
        instance_types =["t3.medium","t3.medium"]
      }
    }
    }
  }
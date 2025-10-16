db_instances = {
    
    mongodb   = {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
    # catalogue = {
    #   ami_id="ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    
    # frontend  = {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
    
    redis = {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
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
    mysql={
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
    rabbitmq={
      ami_id= "ami-09c813fb71547fc4f"
      instance_type="t3.micro"
    }
    # payment= {
    #   ami_id= "ami-09c813fb71547fc4f"
    #   instance_type="t3.micro"
    # }
  }

  zone_id = "Z05764853PUNNX41R0FK9"

  vpc_security_group_ids = ["sg-08c93f3c6fe640a6b"]

  env="dev"

  eks ={
    main ={
    subnets=["subnet-024bf5b7145f95d4b","subnet-0feec5c2a125d6b2e"]
    eks_version=1.32
    node_groups= {
      main = {
        min_nodes = 1
        max_nodes = 3
        instance_types =["t3.medium","t3.large"]
      }
    }
    access = {
    workstation= {
      role             =       "arn:aws:iam::803817915930:role/workstation"
      kubernetes_groups =       []
      policy_arn       =       "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type      = "cluster"
      access_scope_namespaces =  []
    }
  }

  addons ={
    # metric-server = {}
    eks-pod-identity-agent= {}
  }
    }
   
  }


  
# eks = {
#   main = {
#     eks_version = 1.32
#     node_groups = {
#       main = {
#         min_nodes      = 1
#         max_nodes      = 10
#         instance_types = ["t3.medium"]
#         capacity_type  = "SPOT"
#       }
#     }

#     addons = {
#       #metrics-server = {}
#       eks-pod-identity-agent = {}
#     }

#     access = {
#       workstation = {
#         role                    = "arn:aws:iam::803817915930:role/workstation-role"
#         kubernetes_groups       = []
#         policy_arn              = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#         access_scope_type       = "cluster"
#         access_scope_namespaces = []
#       }
#     }

#   }
# }
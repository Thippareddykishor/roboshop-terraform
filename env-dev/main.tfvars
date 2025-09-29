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

  zone_id = "Z098768411FUL8QFJIGI"

  vpc_security_group_ids = ["sg-0fd21419ad7cf8b21"]

  env="dev"

  eks ={
    main ={
    subnets=["subnet-0823463ee51c6c3fd","subnet-0431403cdd3cc4218"]
    eks_version=1.32
    node_groups= {
      main = {
        min_nodes = 1
        max_nodes =2
        instance_types =["t3.medium","t3.medium"]
      }
    }
    access = {
    workstation= {
      role             =       "arn:aws:iam::740279881161:role/workstation"
      kubernetes_groups =       []
      policy_arn       =       "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type      = "cluster"
      access_scope_namespaces =  []
    }
  }

  # addons ={
  #   metric_server = {}
  # }
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
#         role                    = "arn:aws:iam::740279881161:role/workstation-role"
#         kubernetes_groups       = []
#         policy_arn              = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#         access_scope_type       = "cluster"
#         access_scope_namespaces = []
#       }
#     }

#   }
# }
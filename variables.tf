variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-0a1b50421de0cb519"]
}

variable "instances" {
  default = {
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
}

variable "env" {
  default = "dev"
}
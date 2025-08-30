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
  default = [
    "catalogue",
    "frontend",
    "mongodb"
  ]
}

variable "env" {
  default = "dev"
}
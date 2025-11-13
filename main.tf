module "ec2" {
  for_each = var.db_instances
  source                  = "./modules/ec2"
  instance_type           = each.value["instance_type"]
  name                    = each.key
  ami_id                  = each.value["ami_id"]
  vpc_security_group_ids  = var.vpc_security_group_ids
  zone_id                 = var.zone_id
  env                     = var.env
  vault_token             = var.vault_token
}

module "eks" {
  source      = "./modules/eks"
  for_each = var.eks
  env         = var.env
  eks_version = each.value["eks_version"]
  subnets     = each.value["subnets"]
  node_groups = each.value["node_groups"]
  access =  each.value["access"]
  addons = each.value["addons"]
}


# module "vpc" {
#   for_each = var.vpc
#   source = "./modules/vpc"
#   vpc_cidr = each.value["cidr"]
#   name  = each.key
#   env = var.env
#   subnets = each.value["subnets"]
#   default_vpc = var.default_vpc

# }
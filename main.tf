module "ec2" {
  for_each = var.instances
  source                  = "./modules/ec2"
  instance_type           = each.value["instance_type"]
  name                    = each.value["name"]
  ami_id                  = each.value["ami_id"]
  vpc_security_group_ids  = var.vpc_security_group_ids
  zone_id                 = ""
  env                     = "dev"
}
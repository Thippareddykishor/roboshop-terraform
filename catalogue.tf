resource "aws_instance" "instance" {
  count = length(var.instances)
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name= "Catalogue"
  }
  # provisioner "remote-exec" {
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.private_ip
  #   }
  #   inline = [ 
  #     "sudo pip3.11 install ansible",
  #     "ansible-pull -i localhost, -U https://github.com/Thippareddykishor/roboshop-ansible.git roboshop.yml -e user=ec2-user -e password=DevOps321 -e component_name=frontend -e env=dev"     
  #    ]
  # }
}

# data "aws_route53_zone" "selected" {
#   name = "kommanuthala.store"
#   private_zone = false
# }

# resource "aws_route53_record" "catalogue" {
#   name = "catalogue-dev"
#   type = "A"
#   records = [aws_instance.catalogue.private_ip]
#   ttl = 10
#   zone_id = data.aws_route53_zone.selected.id
# }

# resource "null_resource" "name" {
#   provisioner "remote-exec" {
#     connection {
#       type = "ssh"
#       user = "ec2-user"
#       password = "DevOps321"
#       host = aws_instance.catalogue.public_ip
#     }

#     inline = [ 
#       "sudo pip3.11 install ansible",
#       "ansible-pull -i localhost, -U https://github.com/Thippareddykishor/roboshop-ansible.git roboshop.yml -e user=ec2-user -e password=DevOps321 -e env=dev -e component_name=catalogue"
#      ]
#   }
# }
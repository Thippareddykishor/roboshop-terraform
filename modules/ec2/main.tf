resource "aws_instance" "instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name= var.name
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

resource "aws_route53_record" "catalogue" {
  name = "${var.name}-${var.env}"
  type = "A"
  records = [aws_instance.instance.private_ip]
  ttl = 10
  zone_id = var.zone_id
}

resource "null_resource" "name" {
  depends_on = [ aws_route53_record.catalogue ]

  triggers = {
    public_ip_change=aws_instance.instance.public_ip
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = data.vault_generic_secret.ssh.data["username"]
      password = data.vault_generic_secret.ssh.data["paasword"]
      host = aws_instance.instance.public_ip
    }

    inline = [ 
      "sudo pip3.11 install ansible hvac"
      #  "ansible-pull -i localhost, -U https://github.com/Thippareddykishor/roboshop-ansible.git roboshop.yml -e user=ec2-user -e password=DevOps321 -e env=${var.env} -e component_name=${var.name} -e vault_token=${var.vault_token}"
     ]
  }
}
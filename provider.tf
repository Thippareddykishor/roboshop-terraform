terraform {
  backend "s3" {
    
  }
}

provider "vault" {
  address = "http://vault.kommanuthala.store:8200"
  token = var.vault_token
}

# provider "helm" {
#   kubernetes = {
#     config_path = "~/.kube/config"
#   }
# }

# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }

# terraform {
#   required_providers {
#     helm = {
#       source  = "hashicorp/helm"
#       version = ">= 2.4.1" # or latest
#     }
#   }
# }


# provider "helm" {
#   kubernetes = {
#     config_path = "~/.kube/config"
#   }
# }

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

# provider "grafana" {
#   url ="https://kishorreddy.grafana.net"
#   auth ="admin:prom-operator"

# }
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

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
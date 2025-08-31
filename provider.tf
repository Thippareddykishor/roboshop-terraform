terraform {
  backend "s3" {
    
  }
}

provider "vault" {
  address = "http://vault.kommanuthala.store:8200"
  token = var.vault_token
}


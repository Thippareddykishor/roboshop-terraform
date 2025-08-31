dev-apply:
	rm -f .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars -var vault_token=$(vault_token)

dev-destroy:
	rm -f  .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars  -var vault_token=$(vault_token)

prod-apply:
	rm -f  .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-prod/main.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars -var vault_token=$(vault_token)

prod-destroy:
	rm -f .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-prod/main.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars  -var vault_token=$(vault_token)
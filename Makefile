dev-apply:
	rm -f .terraform .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars

dev-destroy:
	rm -f .terraform .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -var-file=env-dev/main.tfvars

prod-apply:
	rm -f .terraform .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-prod/main.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars

prod-destroy:
	rm -f .terraform .terraform.tfstate .terraform.tfstate.backup
	terraform init -backend-config=env-prod/main.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars
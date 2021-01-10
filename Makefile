# .PHONY: load-env
# load-env:
# 	export $(grep -v '^#' .env | xargs)

# terraform

.PHONY: tf-plan
tf-plan:
	cd terraform; terraform plan

.PHONY: tf-apply
tf-apply:
	cd terraform; terraform apply

.PHONY: tf-destroy
tf-destroy:
	cd terraform; terraform destroy

.PHONY: tf-fmt
tf-fmt:
	cd terraform; terraform fmt -recursive

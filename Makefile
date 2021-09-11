BASE_PATH 			:= $(shell pwd)
TERRAFORM_VERSION	:= 1.0.6
AWS_CLI_VERSION		:= 2.2.37

.PHONY: build-awscli-terraform-image
build-awscli-terraform-image:
	@docker image build \
		--build-arg AWS_CLI_VERSION=$(AWS_CLI_VERSION) \
		--build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		-t aws-cli:$(AWS_CLI_VERSION) \
		.

.PHONY: awscli
awscli:
	@docker container run -it --rm \
		-v $(BASE_PATH)/.aws:/root/.aws \
		aws-cli:$(AWS_CLI_VERSION) \
			$(ARG)

.PHONY: terraform
terraform:
	@docker container run -it --rm \
		-v $(BASE_PATH)/.aws:/root/.aws \
        -v $(BASE_PATH)/src:/work \
        --entrypoint terraform \
		aws-cli:$(AWS_CLI_VERSION) \
			$(ARG)
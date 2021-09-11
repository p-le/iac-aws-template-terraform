# How to use
**AWS CLI**, **terraform** will be executed inside Docker Container.

## Step 1: Update Makefile
* TERRAFORM_VERSION: https://hub.docker.com/r/hashicorp/terraform/tags
* AWS_CLI_VERSION: https://hub.docker.com/r/amazon/aws-cli/tags

## Step 2: Prepare AWS credentials

1. Get ACCESS_KEY and SECRET_ACCESS_KEY
2. Create file: `.aws/credentials`
```
[default]
aws_access_key_id=[[ ACCESS_KEY ]]
aws_secret_access_key=[[ SECRET_ACCESS_KEY ]]
```
## Step 3: Config Github Repository Secrets for GitHub Actions
- AWS_ACCESS_KEY_ID: from Step 2
- AWS_SECRET_ACCESS_KEY: from Step 2
- TERRAFORM_CLOUD_API_TOKEN: Register Terraform Cloud and accquire at https://www.terraform.io/cloud

## Step 4: Build local AWSCLI image include Terraform
```
make build-awscli-terraform-image
```

## Step 5: Write Terraform configuration files
1. Update backend.tf, change
* `bucket`: Need to be created manually
* `region`
* `key`
2. Update `terraform.tfvars.example` if needed, then create `terraform.tfvars`
3. Using these commands
```
make terraform ARG=init
make terraform ARG=plan
make terraform ARG=apply
make terraform ARG=destroy
```

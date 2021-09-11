# How to use
**AWS CLI**, **terraform** will be executed inside Docker Container.

## Step 1: Update Makefile
Please update latest version of terraform, awscli docker image
* TERRAFORM_VERSION: https://hub.docker.com/r/hashicorp/terraform/tags
* AWS_CLI_VERSION: https://hub.docker.com/r/amazon/aws-cli/tags

## Step 2: Prepare AWS credentials

1. Click `Use this template`
1. Prepare ACCESS_KEY and SECRET_ACCESS_KEY using AWS Console
2. Create file: `.aws/credentials`
```
[default]
aws_access_key_id=[[ ACCESS_KEY ]]
aws_secret_access_key=[[ SECRET_ACCESS_KEY ]]
```
## Step 3: Config Github Repository Secrets for GitHub Actions
Github Actions also require these secret environments.
- AWS_ACCESS_KEY_ID: from Step 2
- AWS_SECRET_ACCESS_KEY: from Step 2
- TERRAFORM_CLOUD_API_TOKEN: Register Terraform Cloud and accquire at https://www.terraform.io/cloud

## Step 4: Build local AWSCLI image include Terraform
Merge terraform into awscli docker image
```
make build-awscli-terraform-image
```

## Step 5: Write Terraform configuration files
1. `git checkout -b feature/xxx` or `git checkout -b hotfix/xxx`
2. Update backend.tf, change to your remote s3 bucket
	* `bucket`: Need to be created manually
	* `region`
	* `key`
3. Update `terraform.tfvars.example` if needed, then create `terraform.tfvars`
4. You can also use terraform command locally (Require Step2)
```
make terraform ARG=init
make terraform ARG=plan
make terraform ARG=apply
make terraform ARG=destroy
```
5. Commit, Push, and Create Pull Request to `main` branch
6. Confirm Github Actions Pipeline Result
7. If execution plan is fine, merge to master


# How to use
**AWS CLI**, **terraform** will be executed inside Docker Container.

## Step 1: Update Makefile
* TERRAFORM_VERSION: https://hub.docker.com/r/hashicorp/terraform/tags
* AWS_CLI_VERSION: https://hub.docker.com/r/amazon/aws-cli/tags

## Step 2: Build local AWSCLI image include Terraform
```
make build-awscli-terraform-image
```

## Step 3: Prepare AWS credentials

1. Get ACCESS_KEY and SECRET_ACCESS_KEY
2. Create file: `.aws/credentials`
```
[default]
aws_access_key_id=[[ ACCESS_KEY ]]
aws_secret_access_key=[[ SECRET_ACCESS_KEY ]]
```
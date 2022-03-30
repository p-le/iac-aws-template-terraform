#!/bin/bash
# Set GitHub Actions Secrets to be able to run GitHub Actions Workflow
# Required Files:
# -  .env
# -  infra/terraform.tfvars
# Please check .example files and create

if [ -f ".env" ]; then
    echo "Set GitHub Action Secrets from .env"
    export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
    gh secret set AWS_ACCESS_KEY_ID --body "$AWS_ACCESS_KEY_ID"
    gh secret set AWS_SECRET_ACCESS_KEY --body "$AWS_SECRET_ACCESS_KEY"
    gh secret set AWS_REGION --body "$AWS_REGION"
else
    echo "Please create .env file!"
fi

if [ -f "infra/terraform.tfvars" ]; then
    echo "Set GitHub Action Secrets from terraform.tfvars"
    base64 infra/terraform.tfvars > infra/terraform.tfvars.base64
    gh secret set TERRAFORM_TFVARS < infra/terraform.tfvars.base64
    rm -rf infra/terraform.tfvars.base64
else
    echo "Please create infra/terraform.tfvars file!"
fi

if [ -f "infra/config.s3.tfbackend" ]; then
    echo "Set GitHub Action Secrets from config.s3.tfbackend"
    base64 infra/config.s3.tfbackend > infra/config.s3.tfbackend.base64
    gh secret set CONFIG_S3_TFBACKEND < infra/config.s3.tfbackend.base64
    rm -rf infra/config.s3.tfbackend.base64
else
    echo "Please create infra/config.s3.tfbackend file!"
fi

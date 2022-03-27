# How to use this template

Using Terraform to provision infrastructure on AWS.

Using VS Code Remote Containers.

## Step 1: Setup VS Code

- Install VS Code Remote Container Extensions

## Step 2: Prepare AWS credentials

- Create new IAM User
- Grant some IAM Roles. For examples: `IAMFullAccess`, `EC2FullAccess`, `S3FullAccess`
- Generate new `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
- Create File: `.env` based on `.env.example`

## Step 3: Create S3 Bucket for Remote State
- Open AWS S3 Dashboard, then create a new S3 Bucket manually
- Change to `infra` directory: `cd infra`
- Create File: `config.s3.tfbackend` based on `config.s3.tfbackend.example`

## Step 4: Create tfvars

Create File: `terraform.tfvars` based on `terraform.tfvars.example`

## Step 4: Open Remote Container

- Select `Remote-Containers: Open Folder in Container`
- Change to `infra` directory: `cd infra`
- Execute terraform commands

```
terraform.sh init
terraform.sh plan
terraform.sh apply
terraform.sh destroy
```

# GitHub Actions Workflows

- Run `./scripts/setup.sh` to install GitHub CLI and authorize
- Run `./scripts/set_secrets.sh` to register new GitHub Actions Secrets by reading `.env` file

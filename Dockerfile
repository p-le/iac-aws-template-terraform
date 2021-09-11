ARG TERRAFORM_VERSION
ARG AWS_CLI_VERSION

FROM hashicorp/terraform:$TERRAFORM_VERSION as terraform-base

FROM amazon/aws-cli:$AWS_CLI_VERSION

WORKDIR /work

COPY --from=terraform-base /bin/terraform /bin/terraform

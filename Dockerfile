FROM hashicorp/terraform AS terraform-bin

FROM ubuntu:focal

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Require ca-certificates
# Issue: https://stackoverflow.com/questions/52601404/aws-ses-error-x509-certificate-signed-by-unknown-authority
RUN apt-get update \
  && apt-get install -y ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Create the user, update folder permissions
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /bin/bash

COPY --from=terraform-bin /bin/terraform /usr/local/bin/terraform
COPY  ./scripts/terraform.sh /usr/local/bin/terraform.sh

RUN chmod a+x /usr/local/bin/terraform

USER $USERNAME

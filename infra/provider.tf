terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Service = var.service
      Region  = var.region
    }
  }
}


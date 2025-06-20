terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.aws-default-region
  profile    = "default"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

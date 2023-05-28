terraform {

  backend "s3" {
    bucket         = "terraform-state-jyg"
    key            = "aws/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock-jyg"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}



terraform {
  backend "s3" {
    bucket = "romano-terraform-state-727646468320-eu-west-1-an"
    key    = "beatrix/rds/terraform.tfstate"
    region = "eu-west-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "romano-terraform-state-727646468320-eu-west-1-an"
    key    = "beatrix/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
  }
}

provider "aws" {
region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "romano-terraform-state-727646468320-eu-west-1-an"
    key    = "beatrix/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

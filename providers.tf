terraform {
  cloud {
    organization = "Robs-Org-practice"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}
  provider "aws" {
  }
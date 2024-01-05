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

  resource "random_string" "bucket_name" {
    lower               = true
    upper               = false
    length              = 32
    special             = false
  }

  resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

   output "random_bucket_name_result" {
    value = random_string.bucket_name.result
  }

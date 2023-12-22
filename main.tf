terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

  provider "random" {

  }

  resource "random_string" "bucket_name" {
    length              = 16
    special             = false

  }

   output "random_bucket_name_result" {
    value = random_string.bucket_name.result
  }

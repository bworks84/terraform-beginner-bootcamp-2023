terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  # cloud {
  #   organization = "Robs-Org-practice"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.terratowns_access_token
}
 
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Rally Point Coffee Shop"
  description = <<DESCRIPTION
This coffee shop serves as a rally point for all recondos to rest and refit. 
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  # domain_name "3a2f3f.cloudfront.net"
  town = "missingo"
  content_version = 1
}
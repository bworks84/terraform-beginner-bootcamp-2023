terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
    organization = "Robs-Org-practice"

    workspaces {
      name = "terra-house-1"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.user_uuid
  token = var.terratowns_access_token
}

 
module "home_drager_hosting" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  public_path = var.drager.public_path
  content_version = var.drager.content_version
}

resource "terratowns_home" "home" {
  name = "Futuristic City of Drager"
  description = <<DESCRIPTION
Check out this city of the future 
DESCRIPTION
  domain_name = module.home_drager_hosting.domain_name
  # domain_name "3a2f3f.cloudfront.net"
  town = "missingo"
  content_version = var.drager.content_version
}

module "home_dog_bar_hosting" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  public_path = var.dog_bar.public_path
  content_version = var.dog_bar.content_version

}

resource "terratowns_home" "home_dog_bar" {
  name = "Doggo Bar"
  description = <<DESCRIPTION
This dog bar is a great place to have a coffee or beer and let your doggos play with other pups
DESCRIPTION
  domain_name = module.home_dog_bar_hosting.domain_name
  # domain_name "3a2f3f.cloudfront.net"
  town = "missingo"
  content_version = var.dog_bar.content_version
}
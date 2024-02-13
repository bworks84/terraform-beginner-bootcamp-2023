variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "user_uuid" {
 type = string
}

variable "drager" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "dog_bar" {
  type = object({
    public_path = string
    content_version = number
  })
}
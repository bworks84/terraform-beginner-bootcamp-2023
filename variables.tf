variable "user_uuid" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "index_html_filepath" {
  description = "Path to the index HTML file"
  type        = string

}

variable "error_html_filepath" {
  description = "Path to the error HTML file"
  type        = string

}

variable "content_version" {
  description = "The version number of the content"
  type        = number

}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}
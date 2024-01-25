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
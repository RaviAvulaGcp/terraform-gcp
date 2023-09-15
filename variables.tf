variable "project_id" {
  type        = string
  description = "The Google Cloud Project Id"
}

variable "region" {
  type    = string
  default = "europe-west2"
}
variable "gcp_zone" {
  type    = string
  default = "europe-west2-b"
}
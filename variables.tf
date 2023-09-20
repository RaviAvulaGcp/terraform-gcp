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
variable "company" {
  type =string
  default ="frasers"
}
variable "app_name" {
  type = string
  default = "gcp"
  
}
variable "environment" {
  type =string
  default="demo"
}
variable "network-subnet-cidr" {
  type        = string
  description = "The CIDR for the network subnet"
  default = "10.10.15.0/24"
}
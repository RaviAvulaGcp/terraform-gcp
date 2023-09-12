provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "tfstate-gcp-bucket"
    prefix = "terraform/state"
  }
}

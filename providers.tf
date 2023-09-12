provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "tfstate-gcp-bucket"
    prefix = "terraform/state"
    #impersonate_service_account = "mytestsa@my-test-gcp-5308.iam.gserviceaccount.com"
  }
}
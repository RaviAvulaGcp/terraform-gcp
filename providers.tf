provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.81.0"
    }
  }
  
  # backend "gcs" {
  #   bucket = "tfstate-gcp-bucket-ravi"
  #   prefix = "terraform/state"
  #   #impersonate_service_account = "mytestsa@my-test-gcp-5308.iam.gserviceaccount.com"
  # }
}
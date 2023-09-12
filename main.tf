resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
}

resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-gcp-bucket"
  location = "europe-west2"
}

resource "google_storage_bucket" "bucket" {
  name     = "test-bucket-random-001122-22"
  location = "europe-west2"
}
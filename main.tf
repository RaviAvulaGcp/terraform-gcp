resource "google_compute_instance" "terraform" {
  name         = "terraform-gcp"
  machine_type = "e2-standard-2"
  zone         = var.gcp_zone
  tags         = ["web", "dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-gcp-bucket-rk"
  location = "europe-west2"
}

resource "google_storage_bucket" "bucket" {
  name     = "test-bucket-random-120923-23"
  location = "europe-west2"
}

# resource "google_storage_bucket" "default" {
#   name          = "Tes-gcp_bucket"
#   force_destroy = "true"
#   location      = "europe-west2"
#   project       = "${length(var.project_id) > 0 ? var.project_id : "my-test-gcp-5308"}"
#   storage_class = default

#   versioning {
#     enabled = true
#   }

#   labels = "test gcp bucket"
# }
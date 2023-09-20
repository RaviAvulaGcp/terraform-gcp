resource "google_compute_instance" "terraform" {
  name         = "terraform-gcp"
  machine_type = "e2-standard-2"
  zone         = var.gcp_zone
  tags         = ["compute"]
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
resource "random_id" "instance_id" {
  byte_length = 4
}

# create VPC
resource "google_compute_network" "vpc" {
  name                    = "${lower(var.company)}-${lower(var.app_name)}-${var.environment}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = "${lower(var.company)}-${lower(var.app_name)}-${var.environment}-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.vpc.name
  region        = var.region
}
# Create VM
resource "google_compute_instance" "vm_instance_public" {
  name         = "${lower(var.company)}-${lower(var.app_name)}-${var.environment}-vm${random_id.instance_id.hex}"
  machine_type = "n2-standard-2"
  zone         = var.gcp_zone
  hostname     = "${var.app_name}-vm${random_id.instance_id.hex}.frasers.group"
  tags         = ["rdp","http"]

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }

  network_interface {
    network       = google_compute_network.vpc.name
    subnetwork    = google_compute_subnetwork.network_subnet.name
    access_config { }
  }
} 
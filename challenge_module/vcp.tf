# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# Subnet
resource "google_compute_subnetwork" "subnet_jenkins" {
  name          = "${var.project_id}-jenkins-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.20.0.0/24"
}

resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = "projects/rhel-cloud/global/images/rhel-9-v20220719"
    }
  }
  metadata_startup_script = file("${path.module}/custom.sh")
  metadata = {
    enable-oslogin = "TRUE"
  }
  network_interface {
    subnetwork = google_compute_subnetwork.subnet_jenkins.name
    access_config {
      network_tier = "PREMIUM"
    }
  }
  tags = ["jenkins"]
}
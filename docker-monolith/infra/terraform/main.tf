provider "google" {
  version = "1.19.1"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "docker" {
  name = "${format("docker-reddit%02d", count.index+1)}"
  machine_type = "g1-small"
  zone = "${var.zone}"
  tags = ["reddit-app"]
  count = "${var.count}"

  boot_disk {
    initialize_params {
      image = "${var.disk-image}"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata {
    ssh-keys = "${var.ssh-user}:${file(var.key-path)}"
  }
}

resource "google_compute_firewall" "firewall_reddit" {
  name    = "default-allow-reddit"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = "${var.source_ranges}"
  target_tags = ["reddit-app"]
}


provider "google" {
credentials = "${file("cr-gcp-348307-152507cf30d0.json")}"
project = "cr-gcp-348307"
region = "us-west1"
}
resource "google_compute_instance" "grafana" {
  project      = "cr-gcp-348307"
  name         = "grafana"
  machine_type = "e2-medium"
  zone         = "us-west1-a"
  tags         = ["ssh", "port-9090", "port-3000", "port-8080", "port-9000"]
   boot_disk {
    initialize_params {
      image = "cr-pro-sonar"
    }
  }
  network_interface {
    network = "default"
    network_ip = "10.138.0.12"
    access_config {
    }
  }
}


resource "google_compute_firewall" "allow-tcp" {
  name = "allow-tcp"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
resource "google_compute_firewall" "allow-port3000" {
  name = "allow-port3000"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-3000"]
}
resource "google_compute_firewall" "allow-port8080" {
  name = "allow-port8080"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-8080"]
}
resource "google_compute_firewall" "allow-port9000" {
  name = "allow-port9000"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-9000"]
}
resource "google_compute_firewall" "allow-port9090" {
  name = "allow-port9090"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-9090"]
}

provider "google" {
credentials = "${file("helpdesk-vofv-14bc23e3c4e7")}"
project = "helpdesk-vofv"
region = "us-central1"
}

resource "google_compute_instance" "sbx-jenkins-worker02" {
  project      = "helpdesk-vofv"
  name         = "sbx-jenkins-worker02"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["port3000"]
   boot_disk {
    initialize_params {
      image = "sbx-jenkins-worker01-nodejs-image"
    }
  }
  network_interface {
    network = "default"
    network_ip = "10.128.0.6"
    access_config {
    }
  }
}

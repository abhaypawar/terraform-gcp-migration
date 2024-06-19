resource "google_compute_instance" "instance" {
  name         = "your-instance-name"
  machine_type = "n1-standard-1"
  zone         = "your-zone"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

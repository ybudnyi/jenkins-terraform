resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "e2-micro"
  zone         = "us-central1-b"
  tags         = ["bastion"]
  boot_disk {
    initialize_params {
      image = "centos-7-v20200403"
    }  
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private.id
    access_config {}
  }
}
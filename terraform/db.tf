resource "google_compute_instance" "database" {
  name         = "db"
  machine_type = "e2-micro"
  zone         = "us-central1-b"
  tags         = ["db"]
  boot_disk {
    initialize_params {
      image = "db-sql"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }
}
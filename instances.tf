variable "web_count" {
  default = 2
  
}

resource "google_compute_instance" "web" {
  count = "${var.web_count}"
  name         = "web-${count.index}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = ["webserver"]
  boot_disk {
    initialize_params {
      image = "centos-7-v20200403"
    }  
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {}
  }
}
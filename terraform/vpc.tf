resource "google_compute_network" "webserver" {
  project                 = "nginx-328009"
  name                    = "webserver"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
resource "google_compute_subnetwork" "public" {
  name          = "public"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.webserver.id
}

resource "google_compute_subnetwork" "private" {
  name          = "private"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.webserver.id
}

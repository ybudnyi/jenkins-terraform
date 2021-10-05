provider "google" {
  credentials = file("creds/serviceaccount.json")
  project = "nginx-328009"
  region  = "us-central1"
}

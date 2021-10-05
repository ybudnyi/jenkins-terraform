terraform {
  backend "gcs" {
    bucket = "nginx-328009-tfstate"
    prefix = "web"
    credentials = file("creds/serviceaccount.json")
  }
}
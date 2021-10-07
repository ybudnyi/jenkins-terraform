terraform {
  backend "gcs" {
    bucket = "nginx-328009-tfstate"
    prefix = "web"
    credentials = "./creds/serviceaccount.json"
  }
}
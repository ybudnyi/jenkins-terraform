terraform {
  backend "gcs" {
    bucket = "nginx-328009-tfstate"
    prefix = "web"
  }
}
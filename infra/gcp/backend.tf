terraform {
  backend "gcs" {
    bucket = "arc-leman-precip-tfstate"
    prefix = "prod-services"
  }

  required_version = ">= 1.8.0"
}

terraform {
  backend "gcs" {
    bucket = "arc-leman-precip-tfstate"
    prefix = "terraform/state"
  }

  required_version = ">= 1.8.0"
}

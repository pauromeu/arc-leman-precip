terraform {
  backend "gcs" {
    bucket = "arc-leman-precip-tfstate"
    prefix = "terraform/state"
  }

  required_version = ">= 1.8.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "arc-leman-precip"
  region  = "us-central1"
}

resource "google_project_service" "gcs_api" {
  project = "arc-leman-precip"
  service = "storage.googleapis.com"

  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_storage_bucket" "tf_state" {
  name          = "arc-leman-precip-tfstate"
  location      = "US"
  storage_class = "STANDARD"

  versioning { enabled = true }

  lifecycle_rule {
    condition { age = 30 }
    action    { type = "Delete" }
  }

  depends_on = [google_project_service.gcs_api]
}

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
    action { type = "Delete" }
  }

  depends_on = [google_project_service.gcs_api]
}

resource "google_storage_bucket_iam_member" "tf_state_ci" {
  bucket = google_storage_bucket.tf_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:tf-github-ci@arc-leman-precip.iam.gserviceaccount.com"
}

resource "google_project_service" "prereq_crm_api" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false  
}

# CI may enable/disable or read APIs (google_project_service.*)
resource "google_project_iam_member" "ci_serviceusage_admin" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageAdmin"
  member  = "serviceAccount:tf-github-ci@arc-leman-precip.iam.gserviceaccount.com"
}

# CI may create normal buckets like google_storage_bucket.app_data
resource "google_project_iam_member" "ci_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:tf-github-ci@arc-leman-precip.iam.gserviceaccount.com"
}

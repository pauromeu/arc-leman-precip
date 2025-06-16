locals {
  core_apis = [
    "iamcredentials.googleapis.com",
    "serviceusage.googleapis.com",
    "servicemanagement.googleapis.com",
    "storage.googleapis.com"
  ]
}

resource "google_project_service" "core" {
  for_each                   = toset(local.core_apis)
  project                    = var.project_id
  service                    = each.key
  disable_on_destroy         = true
  disable_dependent_services = true
}

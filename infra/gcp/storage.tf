resource "google_storage_bucket" "app_data" {
  name          = "arc-leman-precip-data"
  location      = var.region
  storage_class = "STANDARD"
}

variable "project_id" { default = "arc-leman-precip" }
variable "region"     { default = "us-central1" }

provider "google" {
  project = var.project_id
  region  = var.region
}

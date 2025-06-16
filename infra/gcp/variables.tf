variable "project_id" {
  description = "GCP project where all resources will live"
  type        = string
  default     = "arc-leman-precip"
}

variable "region" {
  description = "Default region for GCP resources"
  type        = string
  default     = "us-central1"
}
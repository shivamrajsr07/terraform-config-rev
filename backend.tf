terraform {
  backend "gcs" {
    bucket = "terraform-state-shivam-eval-2026-unique"
    prefix = "terraform/state"
  }
}
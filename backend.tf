resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = var.bucket_location
  force_destroy = true # Allows deletion of bucket even if it contains objects
}

terraform {
  backend "gcs" {
    bucket  = "kxn-dev"
    prefix  = "terraform/state"  # Optional: Organize the state files within a specific folder in the bucket
  }
}



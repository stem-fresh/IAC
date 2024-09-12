terraform {
  backend "gcs" {
    bucket  = var.bucket_name
    prefix  = "terraform/state"  # Optional: Organize the state files within a specific folder in the bucket
  }
}

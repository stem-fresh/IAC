terraform {
  backend "gcs" {
    bucket  = "kxn-dev"
    prefix  = "terraform/state"  # Optional: Organize the state files within a specific folder in the bucket
  }
}

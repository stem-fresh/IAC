terraform {
  backend "gcs" {
    bucket  = "irys-dev"
    prefix  = "terraform/state"  # Optional: Organize the state files within a specific folder in the bucket
  }
}

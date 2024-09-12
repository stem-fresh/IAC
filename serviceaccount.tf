resource "google_service_account" "my_service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

# Assign roles to the service account
resource "google_project_iam_member" "service_account_permissions" {
  for_each = toset([
    "roles/storage.objectAdmin",    # Needed for pushing to GCR
    "roles/container.admin",        # Needed for deploying Kubernetes manifests in GKE
    "roles/storage.admin",          # Needed for managing GCS backend for Terraform state files
    "roles/storage.objectViewer",   # Needed for pulling images from GCR
    "roles/iam.serviceAccountUser"  # Allows the service account to use other service accounts
  ])
  
  
  project = var.project_id
  member  = "serviceAccount:${google_service_account.my_service_account.email}"
  role    = each.value
}


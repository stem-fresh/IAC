resource "google_container_cluster" "primary" {
  name     = var.gke_cluster_name
  location = var.gke_location
  network  = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.private_subnet.name
  deletion_protection = false
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_pool_name
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    machine_type = var.node_pool_machine_type
    disk_size_gb = var.node_pool_disk_size

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["private-node"]

    service_account = var.service_account_email
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

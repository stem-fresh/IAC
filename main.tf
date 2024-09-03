# main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = var.public_subnet_ip_range
  region        = var.region
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = var.private_subnet_name
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = var.private_subnet_ip_range
  region        = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = var.pod_ip_range
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = var.service_ip_range
  }
}

resource "google_compute_router" "nat_router" {
  name    = var.router_name
  network = google_compute_network.vpc_network.name
  region  = var.region
}

resource "google_compute_router_nat" "nat_gw" {
  name                               = var.nat_name
  router                             = google_compute_router.nat_router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.nat_source_ip_ranges
}

resource "google_compute_firewall" "allow_internal" {
  name    = var.allow_internal_firewall_name
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = [var.internal_source_ranges]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = var.allow_ssh_firewall_name
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.ssh_source_ranges]
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-vm-instance"
  machine_type = var.machine_type
  zone         = "us-central1-f"

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = 10
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.public_subnet.name

    access_config {}
  }
}

resource "google_container_cluster" "primary" {
  name     = var.gke_cluster_name
  location = "us-central1-f"
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

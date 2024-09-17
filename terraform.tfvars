# GCP Project and Region Configuration
project_id                 = "kxn-dev-432901"                # GCP Project ID
region                     = "us-central1"                   # GCP Region where resources will be deployed

# VPC and Subnet Configuration
vpc_name                   = "xyz-dev-vpc"                   # Name of the VPC
public_subnet_name         = "xyz-dev-public-subnet"         # Name of the public subnet
private_subnet_name        = "xyz-dev-private-subnet"        # Name of the private subnet
public_subnet_ip_range     = "10.0.2.0/24"                   # IP range for the public subnet
private_subnet_ip_range    = "10.0.3.0/24"                   # IP range for the private subnet

# GKE (Google Kubernetes Engine) Configuration
pod_ip_range               = "10.2.0.0/16"                   # Pod IP range for the GKE cluster
service_ip_range           = "10.3.0.0/20"                   # Service IP range for the GKE cluster
gke_cluster_name           = "xyz-dev-private-cluster"       # Name of the GKE cluster
gke_location               = "us-central1-f"                 # Location (zone/region) of the GKE cluster
node_pool_name             = "xyz-dev-primary-node-pool"     # Name of the node pool
node_pool_machine_type     = "e2-standard-4"                 # Machine type for the GKE node pool
node_disk_size             = 15                              # Disk size for nodes in the GKE node pool (in GB)
node_count                 = 1                              # Number of nodes in the node pool

# Service Account
service_account_email      = "kxn-dev-service-acc@kxn-dev-432901.iam.gserviceaccount.com"  # Service account email for GKE and other resources

# Compute Instance Configuration
machine_type               = "e2-medium"                   # Machine type for compute instances
boot_disk_image            = "debian-cloud/debian-11"        # Boot disk image used for compute instances (Debian OS)
instance_name              = "xyz-dev-instance"           # Name of the compute instance
zone                       = "us-central1-f"                 # Zone for the compute instance
instance_disk_size         = 30                              # Disk size for the compute instance (in GB)

# NAT Gateway Configuration
router_name                = "xyz-dev-nat-router"            # Name of the NAT router
nat_name                   = "xyz-dev-nat-gateway"           # Name of the NAT gateway
nat_ip_allocate_option     = "AUTO_ONLY"                     # Option for NAT IP allocation (Auto-assign IPs)
nat_source_ip_ranges       = "ALL_SUBNETWORKS_ALL_IP_RANGES" # Source IP ranges for NAT (all subnets and ranges)

# Firewall Rules Configuration
allow_internal_firewall_name = "xyz-dev-allow-internal"      # Name for the internal firewall rule
allow_ssh_firewall_name    = "allow-ssh"                     # Name for the SSH firewall rule
internal_source_ranges     = ["10.0.0.0/16"]                 # Internal source IP range allowed in the firewall rule
ssh_source_ranges          = "0.0.0.0/0"                     # SSH source range (allows SSH from anywhere)
tcp_port_range             = ["0-65535"]                     # TCP port range for the firewall rule
udp_port_range             = ["0-65535"]                     # UDP port range for the firewall rule
tcp_ssh_port               = ["22"]                          # SSH port (TCP port 22)

# Master IP Range (for GKE Private Cluster)
master_ipv4                = "172.16.0.0/28"                 # Private IP range for the GKE master nodes (for private clusters)

# OAuth Scopes
oauth_scope_url            = ["https://www.googleapis.com/auth/cloud-platform"]  # OAuth scope URL for GCP services

# Boolean Variables (used for conditional logic)
bool_true                  = "true"                          # String representing true
bool_false                 = "false"                         # String representing false

# Protocol Configuration
imap                       = "imap"                          # IMAP protocol
tcp                        = "tcp"                           # TCP protocol
udp                        = "udp"                           # UDP protocol

# Additional
pods                       = "pods"
services                   = "services"
icmp                       = "icmp"


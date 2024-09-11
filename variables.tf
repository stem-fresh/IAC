# variables.tf

variable "project_id" {}

variable "region" {}

variable "vpc_name" {}

variable "public_subnet_name" {}

variable "private_subnet_name" {}

variable "public_subnet_ip_range" {}

variable "private_subnet_ip_range" {}
   
variable "pod_ip_range" {}
  
variable "service_ip_range" {}
  
variable "machine_type" {}
  
variable "boot_disk_image" {}
  
variable "node_pool_machine_type" {}
  
variable "node_disk_size" {}
  
variable "service_account_email" {}
  
variable "gke_cluster_name" {}
 
variable "node_pool_name" {}
  
variable "router_name" {}
  
variable "nat_name" {}
  
variable "nat_ip_allocate_option" {}

variable "nat_source_ip_ranges" {}
  
variable "allow_internal_firewall_name" {}
  
variable "allow_ssh_firewall_name" {}
  
variable "internal_source_ranges" {}
  
variable "ssh_source_ranges" {}

variable "gke_location" {}

variable "master_ipv4" {}

variable "bool_true" {}

variable "bool_false" {}

variable "node_count" {}

variable "pods" {}

variable "services" {}

variable "oauth_scope_url" {}

variable "icmp" {}
variable "imap" {}

variable "tcp" {}
variable "udp" {}

variable "tcp_port_range" {}

variable "udp_port_range" {}

variable "tcp_ssh_port" {}

variable "instance_name" {}

variable "zone" {}

variable "instance_disk_size" {}

variable "bucket_name" {}

variable "bucket_location" {}

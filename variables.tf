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
  
variable "node_pool_disk_size" {}
  
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
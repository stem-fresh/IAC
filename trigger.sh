#!/bin/bash

# -e Exit immediately if any command fails
# -x Echo output to the stdout
set -e -x

# Check if terraform is installed
if ! command -v terraform &> /dev/null; then
  echo "Terraform not found, installing..."
  sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt-get update && sudo apt-get install -y terraform
else
  echo "Terraform is already installed"
fi


# Init the terraform
terraform init

# Plan 
terraform plan

# Apply the 
terraform apply -auto-approve

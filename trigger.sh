#!/bin/bash

# -e Exit immediately if any command fails
# -x Echo output to the stdout
set -e -x

# Init the terraform
terraform init

# Plan 
terraform plan

# Apply the 
terraform apply -auto-approve

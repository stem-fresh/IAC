#!/bin/bash

# -e Exit immediately if any command fails
# -x Echo output to the stdout
set -e -x


# Init the terraform
terraform init
terraform plan
# Destroy
terraform destroy -auto-approve

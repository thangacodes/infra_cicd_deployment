#!/bin/bash
echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo -e "\e[1;32m  ***************  BREAK  **************"

echo "Going to init the terraform dir"
terraform init

echo "Going to format the scripts according to the terraform"
terraform fmt

echo "Going to validate the terraform scripts"
terraform validate

echo "Going to perform Dry-Run on terraform provisioning"
terraform plan

echo "Going to execute TF apply command"
terraform apply --auto-approve
exit


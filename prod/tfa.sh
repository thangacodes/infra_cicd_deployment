#! /bin/bash
echo "************************ terraform apply script **********************"
# Terraform init
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform initialization'
terraform init
# Terraform format
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform fmt'
terraform fmt
# Terraform validate
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform validatiton'
terraform validate
# Terraform plan 
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform dry-run'
# Terraform apply
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform apply --auto-approve' 
terraform apply --auto-approve

echo " ******** SLEEP 5 Seconds *********"
sleep 5
exit


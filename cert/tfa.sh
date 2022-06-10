#! /bin/bash
echo $(date '+%Y-%m-%d %H:%M:%S') 'Shell Script is going to be invoke all terraform scripts to provision AWS Services'
echo " ************ BREAK ************"
sleep 3
echo $(date '+%Y-%m-%d %H:%M:%S') 'Going to initialize the directory to download AWS plugins'
terraform init
echo $(date '+%Y-%m-%d %H:%M:%S') 'Going to format the script according Terraform HCL'
terraform fmt
echo $(date '+%Y-%m-%d %H:%M:%S') 'Going to validate the code'
terraform validate
echo $(date '+%Y-%m-%d %H:%M:%S') 'Going to apply the code to provisioning the services'
terraform apply --auto-approve
terraform output > /tmp/terraform_output.txt


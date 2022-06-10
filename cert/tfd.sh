#! /bin/bash
echo $(date '+%Y-%m-%d %H:%M:%S') 'Shell Script is going to be invoke all terraform scripts to provision AWS Services'
echo " ************ BREAK ************"
sleep 1
terraform validate
echo $(date '+%Y-%m-%d %H:%M:%S') 'Going to destroy the services that are provisioned already'
terraform destroy --auto-approve


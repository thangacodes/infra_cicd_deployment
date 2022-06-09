#!/bin/bash
echo -e "\e[1;32m ***** Terraform destroy execution at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo -e "\e[1;32m  ******* Infra is going to be deleted thoroughly now *************"
terraform destroy --auto-approve
exit


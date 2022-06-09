#!/bin/bash
echo -e "\e[1;32m ***** Typical terraform command execution at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo -e "\e[1;32m ******** Terraform format ********"
terraform fmt
echo -e "\e[1;32m ******** Terraform validation *********"
terraform validate
echo -e "\e[1;32m ******** Terraform plan ***********"
exit

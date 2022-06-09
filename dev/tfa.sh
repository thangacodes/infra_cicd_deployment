#!/bin/bash
echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo "Going to execute TF apply command"
terraform apply --auto-approve
exit


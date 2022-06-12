#!/bin/bash
set -x
echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
sleep 2
sleep 2
echo " ******* Going to execute bash function *******"

function tfa(){
   echo "***** tfa - A basic terraform function *****"
   echo " **** Going to execute terraform apply command *****"
   terraform apply --auto-approve
}
tfa



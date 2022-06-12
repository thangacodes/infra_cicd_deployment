#! /bin/bash
set -x
function tfa(){
if [ ls -l | grep -i '*.tf'];
then
     echo "Terraform script files are exist. There are scripts extension ends with .tf"
     echo "Proceeding with terraform apply command"
     terraform apply --auto-approve
else
	echo "Terraform script files not exist"
fi
tfa
}


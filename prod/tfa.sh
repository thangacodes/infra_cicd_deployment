#!/bin/bash
function tfa(){
if [ ls -l /var/lib/jenkins/workspace/Tf_provisioner_concept/prod | grep -i '*.tf'];
then
     echo "Terraform script files are exist. There are scripts extension ends with .tf"
     echo "Proceeding with terraform apply command"
     terraform apply --auto-approve
else
	echo "Terraform script files not exist"
fi
tfa
}


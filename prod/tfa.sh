#! /bin/bash
function tfa(){
if [ ls -l | grep -i '*.tf'];
then
     echo "Terraform script files are exist. There are scripts extension ends with .tf"
     echo "Proceeding with terraform apply command"
     sleep "Before we execute terraform apply, taking '5' seconds break"
     terraform apply --auto-approve
else
	echo "Terraform script files not exist"
fi
tfa
}


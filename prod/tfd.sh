#! /bin/bash
echo "************************ terraform destroy script **********************"
# Terraform destroy
echo $(date '+%Y-%m-%d %H:%M:%S') 'Terraform destroy --auto-approve' 
terraform destroy --auto-approve

echo " ******** SLEEP 5 Seconds *******"
sleep 5
exit

